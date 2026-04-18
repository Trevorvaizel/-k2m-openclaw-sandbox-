from __future__ import annotations

import importlib.util
import json
import os
import sys
import types
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[3]
SERVER_PATH = ROOT / "tools" / "k2m_brain" / "server.py"


class _FakeFastMCP:
    def __init__(self, *args, **kwargs):
        self.args = args
        self.kwargs = kwargs

    def tool(self, *args, **kwargs):
        def decorator(func):
            return func

        return decorator

    def run(self, *args, **kwargs):
        raise AssertionError("The MCP server should not start during unit tests.")


def load_server_module():
    fastmcp_module = types.ModuleType("mcp.server.fastmcp")
    fastmcp_module.FastMCP = _FakeFastMCP
    server_module = types.ModuleType("mcp.server")
    server_module.fastmcp = fastmcp_module
    mcp_module = types.ModuleType("mcp")
    mcp_module.server = server_module

    spec = importlib.util.spec_from_file_location("k2m_brain_server_test", SERVER_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None

    with patch.dict(
        sys.modules,
        {
            "mcp": mcp_module,
            "mcp.server": server_module,
            "mcp.server.fastmcp": fastmcp_module,
        },
    ):
        spec.loader.exec_module(module)

    return module


class LoadApiKeyTests(unittest.TestCase):
    def test_load_api_key_accepts_bom_prefixed_mcp_json(self):
        module = load_server_module()

        with TemporaryDirectory() as temp_dir:
            fake_home = Path(temp_dir)
            claude_dir = fake_home / ".claude"
            claude_dir.mkdir()
            mcp_json = claude_dir / "mcp.json"
            mcp_json.write_text(
                json.dumps(
                    {
                        "mcpServers": {
                            "pinecone": {
                                "env": {
                                    "PINECONE_API_KEY": "test-key",
                                }
                            }
                        }
                    }
                ),
                encoding="utf-8-sig",
            )

            with patch.dict(os.environ, {}, clear=True):
                with patch.object(module.Path, "home", return_value=fake_home):
                    self.assertEqual(module.load_api_key(), "test-key")

    def test_load_api_key_accepts_codex_config_toml(self):
        module = load_server_module()

        with TemporaryDirectory() as temp_dir:
            fake_home = Path(temp_dir)
            codex_dir = fake_home / ".codex"
            codex_dir.mkdir()
            config_toml = codex_dir / "config.toml"
            config_toml.write_text(
                """
[mcp_servers.pinecone.env]
PINECONE_API_KEY = "test-key-codex"
""".strip(),
                encoding="utf-8",
            )

            with patch.dict(os.environ, {}, clear=True):
                with patch.object(module.Path, "home", return_value=fake_home):
                    self.assertEqual(module.load_api_key(), "test-key-codex")


if __name__ == "__main__":
    unittest.main()

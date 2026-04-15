# Transcript Inbox Protocol

Drop raw NotebookLM transcript exports here only when they have not been assigned to a territory yet.

Do not extract atlas notes directly from this inbox. First route the transcript into the right source family, usually:

```text
docs/<territory>/canon/transcripts/
```

Then create or update the matching source memo in:

```text
atlas/source-memos/
```

The source memo decides whether the transcript is:

- a derivation of an existing manifesto
- an example/case that supports an existing note
- a challenge or contradiction to an existing note
- a lens support source that should update `atlas/lenses/`
- a genuinely new source unit that needs atomic extraction

Mental-model transcripts still start here when unassigned. Do not drop them directly into `atlas/lenses/`; lenses are processed atlas notes, not raw transcript storage. If a trial intentionally leaves files in the inbox, each file must still appear in `atlas/coverage-ledger.md` as `intentionally-skipped`.

After routing, update `atlas/coverage-ledger.md` and run:

```powershell
.\scripts\validate-atlas.ps1
```

The validator treats unprocessed transcript files in this inbox as a failure so future agents do not silently skip them.

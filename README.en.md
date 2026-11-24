# JOB OS 🧭

🇵🇱 [Polski](README.md) · 🇬🇧 English

**A personal job search system with an AI assistant** (ChatGPT or Claude) and Google Drive.

Instead of sending the same CV to ten places: first you check what the market actually asks for, build a fact base, and then every offer goes through the same process — verification, no duplicates, assessment, tailored CV, application, follow-up, interview, lessons. AI prepares, you decide.

> Status: **version 1.1** (24.11.2026), in [Polish](README.md) and English. Empty templates only — no one else's data.

## What you get

- **Market scan before the CV:** 10 ads per role family → requirements that recur → each marked ✅ have it with evidence / ⚠️ have it without evidence / ❌ missing. Your CV is built on what companies look for, and only from what you can prove.
- **A Google Sheets tracker with offer memory:** `Job Tracker` (application status), `Offer Memory` (every offer seen, rejected ones too), `Search Rules`. The assistant never reports the same offer twice.
- **Tailored CVs with a quality gate:** the Master CV stays untouched, every CV is a separate Google Doc, checked as a PDF before sending. Includes lessons from practice (Google Docs pitfalls, a contact-free variant for freelance platforms).
- **Interview preparation:** how a specific company hires (sources from the last 12 months), STAR stories, one mock interview a week with a progress log.
- **Rhythm and KPIs:** 5–10 minutes a day, a weekly review, a repeat market scan every 4–6 weeks.
- **Ready-made AI project instructions** and prompts for every stage.

## How it works

```
Profile ──► Market scan ──► Fact base + Master CV ──► AI project + tracker
                                                            │
     ┌──────────────────────────────────────────────────────┘
     ▼
Offer ──► active? ──► duplicate? ──► verdict 🟢🟡🔴 ──► tailored CV ──► PDF QA ──► you send
                                                                                    │
                   lessons ◄── interview ◄── weekly mock interviews ◄── follow-up ◄┘
```

## Getting started

1. Download the package: [`dist/JOB_OS_Starter_Pack_v1.1.zip`](dist/JOB_OS_Starter_Pack_v1.1.zip) or copy the [`en/`](en/) folder.
2. Put the folder on your Google Drive.
3. Open [`en/README.md`](en/README.md) and go through the 8 steps. Each one ends with a "Done when…" check.

Setup takes about 5–7 hours, spread over a few days. You need a Google account and ChatGPT or Claude with projects.

The job source list in `Search_Policy.md` is a starter list for Poland, where the system was built — replace it with sources for your country.

## Rules

- AI prepares, you decide and you send.
- No invented facts, numbers or experience.
- No offer is "new" until the assistant has checked both registers.
- "Saved" only after a confirmed save.

## Responsibility

- JOB OS is a set of templates and instructions, **not career coaching or legal advice**.
- The AI can make mistakes. Check every CV, message and offer assessment before sending — you are responsible for what you send.
- Use job boards according to their terms: no mass applying and no automated data collection where the terms forbid it.
- The package is provided "as is", without warranty (MIT licence).

## Privacy

- The package has no server and collects nothing. You keep the files and the tracker on your own Google Drive.
- Your CV and profile data are processed by the AI assistant you use (ChatGPT, Claude). Check your account's privacy settings, including whether conversations may be used to train models.
- Don't paste national ID numbers, other people's data (e.g. referees without their consent) or documents under NDA.
- Never share your tracker or Master CV — hand over only the empty templates.

## Feedback and support

This is a private project built in my spare time. Report bugs and ideas in [Issues](https://github.com/dbukowinski/job-os-ai/issues) ("Feedback" template). I reply when I can; Issues are not for individual CV reviews. Pull requests welcome — every change in `en/` needs the same change in `pl/`.

## Repo structure

```text
README.md, README.en.md    overview (PL / EN)
pl/                        Polish package — copy it to your Drive
en/                        English package
dist/                      ready-made ZIPs of both editions
scripts/build-zip.sh       builds the ZIPs from pl/ and en/
CHANGELOG.md, LICENSE
```

Method details: [`en/00_Workflow_and_Prompts/JOB_OS_Playbook.md`](en/00_Workflow_and_Prompts/JOB_OS_Playbook.md).

## Licence

MIT — see [LICENSE](LICENSE). Some ideas in version 1.1 were inspired by a public job-search checklist by matkowski.ai; details in section 17 of the playbook.

# JOB OS — start (version 1.1)

A personal job search system with an AI assistant (ChatGPT or Claude) and Google Drive. This file walks you through setup in 8 steps. Each step ends with a **"Done when…"** check — move on only when it is met.

The playbook (`00_Workflow_and_Prompts/JOB_OS_Playbook.md`) is the documentation for later: it explains why the system works the way it does.

> **Data status:** empty templates. The package contains no one else's CVs, offers or application data.

## What you need

- A Google account (Drive, Docs, Sheets).
- ChatGPT or Claude with projects and Google Drive connected. It also works without the connection, but you update the sheet by hand.
- Your current CV (any format) and links: LinkedIn, portfolio or GitHub if you have them.
- 2–4 role families you are looking for, e.g. "Senior Business Analyst", "Product Owner".
- About 5–7 hours for setup, spread over a few days.

## Setup in 8 steps

### 1. Profile and goals · 30–60 min
Fill in `00_Workflow_and_Prompts/Candidate_Profile_TEMPLATE.yaml`: target roles, location, employment model, pay range, hours, exclusions. Do not add data you do not need.

**Done when** the profile has target roles, conditions (model, rate, hours, location) and a list of exclusions.

### 2. Market scan before the CV · 60–90 min per role family
Before touching your CV, review 10 active job ads for each role family. List the requirements that recur and mark each one: ✅ have it with evidence, ⚠️ have it without evidence, ❌ missing. Use a copy of `00_Workflow_and_Prompts/Market_Requirements_TEMPLATE.md`. The assistant can collect the ads for you (prompt below), but you approve the statuses.

**Done when** every requirement that appears in at least 5 of the 10 ads has a status and a next step.

### 3. Fact base · 1–2 h
Put your CV into `01_Master_CV/` — this is the Master CV, which you never change for a single application. Fill in `00_Workflow_and_Prompts/Career_Knowledge_Base.md`: projects, evidence, STAR stories. For ⚠️ requirements from step 2, look for evidence.

**Done when** the Master CV is in `01_Master_CV/` and every ✅ requirement has evidence named in the Career Knowledge Base.

### 4. Drive and tracker · 20–30 min
Copy the whole package folder to your Google Drive. Import `02_Application_Tracker/JOB_Application_Tracker_TEMPLATE.xlsx` into Google Sheets as a new spreadsheet (File → Import, or open the file and save it as Google Sheets).

**Done when** Google Sheets has three tabs named exactly `Job Tracker`, `Offer Memory`, `Search Rules`.

### 5. AI project · 15 min
Create a project `Job — [your name]` in ChatGPT or Claude. Paste the content of `00_Workflow_and_Prompts/Project_Instructions.md` into the project instructions. Replace `[URL_...]` with links to **your own** documents. Connect Google Drive.

**Done when** the assistant, asked "how many rows does Offer Memory have?", reads the sheet and gives a number (0 at the start) instead of guessing.

### 6. Control test · 20 min
Paste one active job ad and write: "Analyse the offer, add it to the tracker and, if it is worth it, create a tailored CV". Then paste the same ad a second time.

**Done when** the second attempt creates no new row and no alert, and the CV passes `00_Workflow_and_Prompts/CV_QA_Checklist.md`.

### 7. Weekly rhythm · 10 min
Add recurring calendar events: a daily review (5–10 min), a weekly review (20–30 min) and **one mock interview a week** (about 60 min) until the real interview. Log mock interviews in `07_Interview_Prep/Mock_Interview_Log.md`.

**Done when** all three are in your calendar.

### 8. Monitoring · optional
Turn on automated search only after a successful step 6. Before every report the assistant must read `Job Tracker` and `Offer Memory`.

**Done when** the first automated run reports none of the offers already in `Offer Memory` as new.

## Daily work — short commands

| You want to | Write to the assistant |
|---|---|
| Assess an offer | "Analyse the offer, add it to the tracker and, if it is worth it, create a tailored CV: [link]" |
| Market scan | "Run a market scan for the role [role] using prompt 16.7 from the playbook" |
| New offers | "Find new active offers using prompt 16.3" |
| Prepare for an interview | "Check the hiring process at [company] (prompt 16.8), then run a mock interview (16.5)" |
| Follow-up | "Check applications with no reply for 5–7 days and draft follow-ups" |
| Weekly summary | "Run the weekly review (16.6)" |

The full prompts are in section 16 of the playbook.

## Rules the system enforces

- AI prepares, you decide and you send. Status `Sent` only on confirmation.
- No invented facts, numbers, tools or experience. A ❌ requirement never goes into the CV as a skill.
- No offer is "new" until the assistant has checked both registers.
- The Master CV is untouchable; every tailored CV is a separate document.
- You look at the PDF before sending — what counts is what the recruiter sees.

## Responsibility and privacy

- JOB OS is templates and instructions, not career coaching or legal advice. The AI can make mistakes — you are responsible for the application you send.
- The package collects nothing. Your CV and profile data are processed by the AI assistant you use — check your account's privacy settings (including model training on conversations).
- Don't paste national ID numbers, other people's data without their consent or documents under NDA.
- Use job boards according to their terms: no mass applying and no automated data collection where the terms forbid it.

## What is in the package

```text
README.md                         ← you are here
00_Workflow_and_Prompts/          playbook, project instructions, profile, fact base,
                                  market scan, sources, CV checklist, anti-duplicates
01_Master_CV/                     your base CV (read-only)
02_Application_Tracker/           workbook template: Job Tracker, Offer Memory, Search Rules
03_Job_Offers_Raw/                ad text, source, date
04_Custom_CV_Google_Docs/         CVs tailored to specific offers
05_Custom_CV_PDF_DOCX/            versions to send
06_Recruiter_Messages/            message and follow-up templates
07_Interview_Prep/                STAR stories, company hiring process, mock interview log
08_Archive/                       old versions and closed cases
```

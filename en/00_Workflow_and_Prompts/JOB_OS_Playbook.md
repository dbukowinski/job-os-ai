# JOB OS — a universal AI-assisted job search system

**Methodology, architecture, folder structure, quality rules and onboarding guide for a new candidate**
Version 1.1 | 24 November 2026 | Document to hand over / adapt

> **Core principle:** the AI project (ChatGPT or Claude) is the operations centre, but Google Drive and the registers are the source of truth. AI prepares and saves artefacts; the candidate controls decisions, information about themselves and the actual sending of each application.

> **How to read this document:** to get started, `README.md` in the package root is enough (8 steps, each with a "Done when…" check). This playbook is the documentation: come back to it when you want to know why something works the way it does.

## 1. What is JOB OS?

JOB OS is a personal career management system. It combines an AI project (ChatGPT Project or Claude Project), Google Drive, Google Docs, a Google Sheets workbook, browsing current job ads and optional schedules. Instead of sending CVs chaotically, it runs a repeatable process: **profile → market scan → fact base → search → activity check → duplicate check → assessment → decision → CV → application → follow-up → interview → lessons**.

It works for a BA, developer, marketer, data analyst, PM, salesperson and any other role. What we transfer is **the mechanics and standards**, not the original user's biography or achievements.

**Operational goals:** fewer poorly matched applications; a CV built on requirements that actually recur in job ads; fast tailored CVs for selected offers; no re-reporting of the same offers; a decision history; regular interview practice; a clear picture of the pipeline.

**Important distinction:** elements proven in the original system are marked "baseline". Proposals and templates for the next person are marked "recommendation".

## 2. Architecture and responsibilities

```text
CANDIDATE (approves data and decisions)
 |
 v
AI PROJECT "JOB" (ChatGPT or Claude) — interface, analysis, drafting, operations
 |
 +-- Google Drive ────────────────────────────────────+
 |   Workflow / Project Instructions                  |
 |   Master CV (read-only) + Career Knowledge         |
 |   Market Requirements (market scan)                |
 |   Google Sheets: Job Tracker / Offer Memory / Rules|
 |   Google Docs: tailored CVs and interview material |
 +-- Web / ATS / company sites — current job ads
 +-- Gmail / Calendar (optional, only when authorised)
 +-- Automations — recurring checks, reminders
```

**One system, different data roles:**
- **Master CV:** the base of approved facts and work history; never overwritten for an application.
- **Career Knowledge Base:** detailed project examples, achievements, evidence, technologies with proficiency level, constraints, STAR stories.
- **Market Requirements:** requirements that recur in job ads for the chosen roles, each with a status: have it with evidence / have it without evidence / missing.
- **Workflow / Project Instructions:** assistant behaviour rules, stages, quality policies and safety conditions.
- **Job Tracker:** the only operational source of truth for application status, send date, CV and follow-up.
- **Offer Memory:** memory of every ad ever seen (rejected ones too); prevents duplicates.
- **Search Rules:** short monitoring policy, publish criteria and fallback.
- **Chat:** a convenient front-end, but **not** a long-term register.

**Permissions:** AI may read data and prepare materials. Editing the Tracker and creating documents are auditable operations. Sending an application, email or message must be deliberate, authorised and confirmed; preparing a CV does not mean the application was sent.

## 3. Folder structure in Google Drive

Baseline: one root folder and **nine folders numbered 00 to 08**. Use one canonical project folder and one tracker — no parallel copies.

```text
Job_OS_[First_Last]/
├── README.md                                 [start: 8 steps]
├── 00_Workflow_and_Prompts/
│   ├── JOB_OS_Playbook.md                    [this document]
│   ├── Project_Instructions.md               [text for the AI project instructions]
│   ├── Candidate_Profile_TEMPLATE.yaml       [candidate configuration]
│   ├── Career_Knowledge_Base.md              [verified stories and evidence]
│   ├── Market_Requirements_TEMPLATE.md       [market scan: 10 ads per role family]
│   ├── Search_Policy.md                      [sources, monitoring and scoring]
│   ├── CV_QA_Checklist.md                    [ATS, Google Docs and PDF checks]
│   └── Opportunity_Memory_Dedup_SKILL.md     [anti-duplicate rules]
├── 01_Master_CV/
│   ├── [First_Last]_Master_CV.docx           [untouchable base]
│   ├── [First_Last]_Master_CV.pdf            [reference version]
│   └── Evidence_and_Certifications/          [optional: evidence, portfolio]
├── 02_Application_Tracker/
│   └── JOB_Application_Tracker               [Google Sheets: 3 tabs]
├── 03_Job_Offers_Raw/
│   └── YYYY-MM-DD_[Company]_[Role].md        [text, source, date]
├── 04_Custom_CV_Google_Docs/
│   └── [First_Last]_CV_[Company]_[Role]_YYYY [Google Doc]
├── 05_Custom_CV_PDF_DOCX/
│   ├── [First_Last]_CV_[Company]_[Role]_YYYY.pdf
│   └── [First_Last]_CV_[Company]_[Role]_YYYY.docx
├── 06_Recruiter_Messages/
│   ├── Outreach_Templates.md
│   └── YYYY-MM-DD_[Company]_[Role]_Messages.md
├── 07_Interview_Prep/
│   ├── STAR_Stories.md
│   ├── Mock_Interview_Log.md                 [one mock interview a week]
│   ├── Company_Process_TEMPLATE.md           [how a specific company hires]
│   └── YYYY-MM-DD_[Company]_[Role]_Interview.md
└── 08_Archive/
    └── [rejected old versions and closed material]
```

The nine folder names come from the baseline. File names inside them are a **proposed standard**.

### Naming convention

`YYYY-MM-DD_Company_Role_Type_vNN` for working notes. For CVs: `[First_Last]_CV_[Company]_[Role]_[Year]`; the name may include the language `PL/EN`. Avoid `final_v3_new_fixed`. The stable `JOB-0001` from Offer Memory should appear in the note name or metadata when versions need tracking.

## 4. File inventory: minimum and extensions

**Required for the MVP:**
1. `Project_Instructions.md` — instructions set in the AI project.
2. `Master_CV` — the approved base CV.
3. `Career_Knowledge_Base.md` — facts, case studies and gaps.
4. `Market_Requirements.md` — market scan for each role family (copy of the template).
5. `JOB_Application_Tracker` — Google Sheets with `Job Tracker`, `Offer Memory`, `Search Rules`.
6. `CV_QA_Checklist.md` — the quality gate for every document.

**Worth adding later:** `Candidate_Profile_TEMPLATE.yaml`, `Search_Policy.md`, `Opportunity_Memory_Dedup_SKILL.md`, `STAR_Stories.md`, `Mock_Interview_Log.md`, `Company_Process_TEMPLATE.md`, outreach templates and a weekly report. You do not need an SQL database, vector store or ATS tool to start: a spreadsheet handles a personal volume.

## 5. Onboarding a new person — order of steps

Each step ends with a **"Done when…"** check. Do not move on until it is met.

**Step 1. Profile and goals (30–60 min).** Pick 2–4 role families; collect locations, languages, employment model (employment contract / B2B / contract), salary range, availability, remote/hybrid mode, excluded industries and roles. Decide whether the goal is a main job or side gigs. Save it in `Candidate_Profile_TEMPLATE.yaml`.
*Done when* the profile has target roles, conditions (model, rate, hours, location) and a list of exclusions.

**Step 2. Market scan before the CV (60–90 min per role family) — new in 1.1.** Collect 10 active ads from the last 30 days for each role family. List the requirements that recur and count how many ads mention each. Give every requirement a status from the Career KB: ✅ have it with evidence, ⚠️ have it without evidence, ❌ missing. Save the result in `Market_Requirements.md` (copy of the template). Details in 5.1.
*Done when* every requirement that appears in at least 5 of the 10 ads has a status and a next step.

**Step 3. Fact base (1–2 h).** Upload your CV, LinkedIn/GitHub/portfolio, project descriptions and certificates. Separate confirmed facts, declared facts and gaps to clarify. For ⚠️ requirements from step 2, look for evidence (project, artefact, feedback, certificate) and add it to the Career KB, or leave it ⚠️. Never claim other people's achievements. Save the Master CV as read-only.
*Done when* the Master CV is in `01_Master_CV/` and every ✅ requirement has evidence named in the Career KB.

**Step 4. Drive and tracker (20–30 min).** Create the tree from section 3, upload the package files, import the empty `.xlsx` template into Google Sheets as a new spreadsheet, fill in internal links.
*Done when* Google Sheets has three tabs named exactly `Job Tracker`, `Offer Memory`, `Search Rules`.

**Step 5. AI project (15 min).** Create a project `Job — [Name]` in ChatGPT or Claude; paste `Project_Instructions.md` into the project instructions; replace `[URL_...]` with links to **your own** documents; connect Google Drive.
*Done when* the assistant, asked "how many rows does Offer Memory have?", reads the sheet and gives a number (0 at the start) instead of guessing.

**Step 6. Control test (20 min).** Paste one active job ad; check the analysis, the Memory entry, the Tracker entry, the generated CV, the links and the status. Paste the same ad again.
*Done when* the second attempt creates no new row and no alert, and the CV passes `CV_QA_Checklist.md`.

**Step 7. Weekly rhythm (10 min) — new in 1.1.** Put into your calendar: a daily review of 5–10 min, a weekly pipeline review of 20–30 min and **one mock interview a week** (about 60 min) until the real interview. Details in 13.
*Done when* all three are in the calendar as recurring events.

**Step 8. Monitoring (optional).** Only after a successful step 6. Add a schedule if needed; never announce offers as new without checking both registers.
*Done when* the first automated run reads both tabs and reports none of the offers already in Offer Memory as new.

### 5.1 Market scan — how to do it

1. **Sources:** company career pages and the job boards in `Search_Policy.md`. Take only active ads from the last 30 days, from different companies (max 2 per company).
2. **Write requirements in the ads' own words** (e.g. "BPMN", "SQL", "stakeholder management"), not your synonyms — the ATS and the recruiter filter on those words.
3. **Count frequency:** how many of the 10 ads mention the requirement. The core of the role is ≥5/10; 3–4/10 is "common"; skip the rest.
4. **Assign a status** from the Career KB, not from self-assessment: ✅ have it with evidence, ⚠️ have it without evidence, ❌ missing.
5. **Next step:** ✅ → these words go into the Summary, Skills and experience bullets; ⚠️ → add evidence or a STAR story; ❌ → decide: learn it and build a small project to show, show a related skill, or be honest about the gap. **Never put a ❌ into the CV as a skill.**
6. **Pay ranges:** note the range from the ads (min–max, contract type). Useful for the profile and the salary conversation.
7. **Repeat:** every 4–6 weeks or when you change role family.

The assistant runs the market scan on request (prompt 16.7), but the candidate approves the ✅/⚠️/❌ statuses.

## 6. Data model — three tabs in one workbook

### 6.1 Job Tracker (baseline, 17 columns A:Q)

```text
A Date found
B Company
C Role
D Job link
E Source
F Status
G Verdict
H Match %
I Key requirements
J Strong matches
K Risks / gaps
L Positioning
M CV changes
N CV version
O Recruiter message
P Application date
Q Follow-up / Notes
```

**Semantics:** column F is the actual stage; P is the date of the **confirmed send**, not the date the CV was created. The CV version in N holds a direct link to the relevant Google Doc or the latest checked PDF. Notes can hold the next follow-up date, history and decisions. Update an existing ad in its existing row.

**Statuses:** `To analyse`, `To decide`, `CV prepared`, `Ready to send`, `Sent`, `Follow-up`, `HR interview`, `Technical interview`, `Offer`, `Rejected`, `Withdrawn`, `Closed`. Do not switch to `Sent` without confirmation. For `Follow-up`, check whether there was an application or only contact with a recruiter.

### 6.2 Offer Memory (baseline, 17 columns A:Q)

```text
A Offer ID
B Company
C Role
D Canonical key (company+role)
E Canonical URL
F Alternative URLs
G First seen
H Last verified
I Memory status
J Status in Application Tracker
K Match %
L Hours/week (confirmed)
M Semantic signature / requirements
N Cluster
O Job Tracker row
P Source
Q Notes / block reasons
```

Every offer found gets a stable ID `JOB-0001`, `JOB-0002` and so on, **even if it was rejected or never entered the application process**. One recruitment = one record. `Offer Memory` is not a vector database; it holds IDs, normalisation, a text signature and the result of the similarity check.

**Memory statuses:** `SEEN`, `REPORTED_NOT_APPLIED`, `PREPARED_NOT_CONFIRMED`, `APPLIED`, `REJECTED`, `CLOSED`, `TALENT_POOL`, `DUPLICATE_REVIEW`. Memory status and application status are not automatically the same.

### 6.3 Search Rules (baseline, 4 columns A:D)

`SECTION | RULE | ACTION | NOTE`. Covers, among others: precedence of the `Job Tracker` status, reading both tabs, URL normalisation, semantic matching, activity checks, source order and ad freshness (new in 1.1), the publish rule, fallback on errors and the weekly audit.

## 7. From job ad to decision

### Stage 0 — Preflight: do not search for "new" blindly

Read the Tracker metadata (tab names, used range), then `Job Tracker` and `Offer Memory`. Keep the row number, URL, company, role, status. Without reading both tables the system may not claim an offer is new; in automated monitoring, hold the alert and report the problem.

### Stage 1 — Finding the offer and confirming it is active

Source order: company career pages and their ATS (e.g. Greenhouse, Lever, Ashby, Workable, Teamtailor), then the job boards in `Search_Policy.md`, then contacts. Start with ads from the last 24–72 hours: older ones have already collected many applications. Checking two well-chosen sources daily beats checking five once a week.

Open the target link and confirm the form still accepts applications. Mark separately: `active`, `closed`, `unconfirmed` and `talent pool`. An ad visible on an aggregator does not prove the form is active.

### Stage 2 — Deduplication (hard gate)

Compare: (1) the ATS job ID or canonical URL, (2) the normalised company and role, (3) semantically similar requirements, scope, seniority, hours, location, pay and link. Remove tracking parameters (`utm_*`, `gclid`, `fbclid`, `trk`) but keep `job_id`/UUID identifiers. The same company and a similar title do not always mean the same process. When similarity is high and unresolved, mark `DUPLICATE_REVIEW` and do not alert it as new.

### Stage 3 — Hard filters and fit

**Hard gates:** legal right to work in the country/region, unacceptable work model, mandatory licences/permits, too much overlap with other hours, a form that is actually closed. For side contracts, distinguish 10–20 h/week from a full-time job; `remote` does not mean "from my country".

For each offer give a 0–100% fit, a verdict `🟢 apply`, `🟡 after tailoring`, `🔴 skip`, **three strengths and three risks**, positioning, CV changes, an interview argument, short outreach and the next step. Use the statuses from `Market_Requirements.md`: a ❌ requirement is a risk, not a keyword for the CV.

**Recommended, optional scoring:** skills 40%, domain 15%, seniority/responsibility 15%, mode and availability 15%, pay 10%, career direction 5%. Score each criterion 0–1 and weight it. Do not mark unknown conditions as met; show the confidence level. A hard gate can outweigh even a high score.

### Stage 4 — Recording history and deciding

Write every genuinely new observation **first** to `Offer Memory` and verify it by reading back. Add to `Job Tracker` the offers analysed in depth, chosen for application or already in progress. Offer Memory and the Tracker must not hold conflicting statuses; on conflict, `Job Tracker` is the source of truth for the application.

### Stage 5 — Tailored CV

For green and strong yellow offers create a **new Google Doc** from the Master CV, the Career KB and `Market_Requirements.md`. Tailor the Summary, Skills and selected experience bullets in the ad's words, but only where there is evidence (✅). Keep true dates, titles, scope of responsibility and tool proficiency. Save the link in the `CV version` column. Never edit the Master CV for a single application.

### Stage 6 — QA, export and sending

Check content and format against `CV_QA_Checklist.md`. Apply styles (bold, sizes) after the last text change and check every heading down to its last character. Export the PDF **after the last edit** and look at every page — the paragraph count does not tell you what the PDF looks like. Export the PDF and optionally a DOCX. The candidate sends through the form or explicitly authorises the operation. Only after confirmation fill in `Application date` and `Status = Sent`.

### Stage 7 — Outreach, follow-up and interview

Prepare a short message built on something specific from the ad, without mass-mail openers. About 5–7 days after sending, if there is no reply and contact makes sense, propose a follow-up; never send a repeat without confirmation.

Before an interview (new in 1.1):
1. **Find out how this company hires:** stages, format, task and question types. Sources: the career page, process descriptions in the ad, candidate reports (e.g. Glassdoor) — **only from the last 12 months**, with source and date. Save it in a copy of `Company_Process_TEMPLATE.md`.
2. **Practise on the task types this company uses.** Preparing for one company is shorter and more effective than general preparation.
3. Prepare a 60–90 second pitch, 3–5 STAR stories, questions for the company and risks.
4. Run the mock interview **one question at a time**, then `what worked / what was weak / better answer`.

### Stage 8 — Closing and lessons

Keep the `Rejected`, `Closed`, `Offer`, `Withdrawn` status and a note with feedback; never delete the trail. Once a week review the pipeline, overdue follow-ups, channel effectiveness and fit quality. Lessons that repeat (e.g. the same gap in three processes) go back into `Market_Requirements.md` and the Career KB.

## 8. CV standard and quality gate

This standard is the methodology baseline; the visual style can be a parameter of the new person's profile. Never copy another candidate's name, address, phone, links or industries.

**Base format:** at most 2 pages, one column, ATS-friendly, no tables, icons, sidebars or graphics. Aptos 10.5 pt; sections 12–14 pt, bold; line spacing 1.0–1.15; compact readable margins; plain bullets. The header (name, title, contact, LinkedIn/portfolio/GitHub when present) centred. Links must be live.

**Section headings:** bold. **Every role heading:** bold in full, e.g. `Senior Analyst | Company — project / client context`. No artificial success counters. ATS keywords must come from real experience (status ✅ in `Market_Requirements.md`).

**What to cut first if the CV runs over 2 pages:** (1) side projects not relevant to the ad, (2) older, less relevant roles, (3) long tool lists, (4) secondary experience bullets, (5) repetition between Summary and Skills. Do not shrink the base font to fit.

**Known Google Docs pitfalls (lessons from practice, new in 1.1):**
- Apply styles only after all text changes — replacing text can split a range and drop bold from the last letter.
- Bold the whole heading paragraph including its last character, and check that last character in the finished document (a typical bug: an unbolded final "S" or ")").
- Do not lay out skills as long lists separated by `|` — when a line wraps, the `|` hangs at the start of the next line. Use short phrases separated by commas or semicolons.
- Do not create spacing with empty paragraphs; keep a role heading together with its dates and bullets (`keep with next`).
- A successful API write does not mean the layout is right — the PDF you looked at decides.

**Contact-free variant:** some freelance platforms (e.g. Upwork) forbid contact outside the platform before a contract. For them prepare a separate CV variant without email, phone and contact links; check both the text and the PDF. The Master CV stays unchanged.

**GDPR / privacy clause:** at the bottom of the document, small light-grey text (8–8.5 pt in the baseline) with no separate heading. Adapt its wording and whether you need it to the country, employer requirements and language version. A sample English clause is in `CV_QA_Checklist.md`; this is not legal advice.

**QA 3×:** fact check → document formatting check → looking at the final PDF. Always check name and diacritics, header centring, bold down to the last character, live links, maximum two pages, clause position and the correct link in the tracker (the latest checked PDF; older versions marked as superseded).

## 9. Positioning, messages and interview training

**Alternative profiles:** for each role family define a `value proposition`, strong confirmed projects, keywords with justification (from `Market_Requirements.md`) and the biggest gaps. A person changing roles should not pretend to have held the new role already: show **compatible responsibilities and readiness for the move**.

**Outreach:** 400–700 characters, 1–2 specifics from the ad, one strong profile argument, a soft call to action. Avoid "I hope this message finds you well", do not retell the CV or your whole biography. Match the recruiter's language.

**Mock interview:** one question → the candidate's answer → `✅ What worked`, `⚠️ What was weak`, `💡 Better version`. Use STAR (Situation, Task, Action, Result) for experience. The result must match the facts; missing numbers are no reason to invent them.

**A mock interview every week (new in 1.1):** one mock interview a week, at a fixed time, about 60 minutes, until the real interview — not one the day before. It can be with AI, another person or a mock-interview service. If possible, record it and listen the next day: that is when you hear that you think in silence or talk too long. Log each one in `Mock_Interview_Log.md` with one thing to improve next time.

## 10. Monitoring and automations

**Two separate tracks:**
- `Main Career Search`: main job offers, pay, location and career direction.
- `Side Gigs / Part-time`: paid contracts, e.g. 10–20 h/week, fixed-scope freelance for 2–4 weeks, AI Trainer/Evaluator or consulting. Extra filters for hours, overlap and country apply here. In the baseline an alert required **a combined fit of ≥80%**, a confirmed active ad and a write to Offer Memory before publishing.

**Every automation run:** (0) connect and read Tracker+Memory; (1) search several sources, freshest first; (2) activity; (3) dedup; (4) candidate conditions; (5) scoring; (6) write Memory and read back; (7) only then notify. If Google tools are unavailable, do not claim a new offer was definitely never seen before. The alert may be held.

**Operating calendar (recommendation):** a daily scan on working days or every day, a weekly backfill of older active ads, a weekly pipeline review, a follow-up proposal after 5–7 days. Adapt the schedule to the person; never create automations without their consent.

**Never automate without consent:** mass applying, sending outreach, passing a private CV to unknown parties, changing the status to `Sent`, publishing sensitive data.

## 11. Anti-duplicates — algorithm and idempotency rules

```text
INPUT: an offer found
PRECONDITION: Job Tracker + Offer Memory read successfully
normalize_url(): remove tracking, keep ad identifiers
normalize_key(): simplify company + title, keep the role's specialisation
if ATS_job_id or canonical_url exists: UPDATE the existing record
else if company/role and description point to the same recruitment: VERIFY_DUPLICATE
else: create a new JOB-#### in Offer Memory
verify readback()
if already_APPLIED / already_REPORTED / CLOSED: NO NEW ALERT
if active AND eligible AND match >= threshold: ALERT
else: KEEP THE TRACE IN MEMORY, NO ALERT
```

**Allowed re-notification:** a genuinely new job ID, a reopening, a material change of conditions, an interview invitation or a stage change — **as an update to the existing entry**, not as "an unnoticed new offer". Store alternative URLs in column F. Never use embedding similarity alone as the only key.

## 12. Change management, security and data quality

- Least privilege: the candidate controls who sees their CV, phone, email, recruitment history and references.
- Give a new user **only the empty template**, never another person's Tracker or Master CV.
- Keep personal data in prompts to the minimum needed; do not copy NDA documents, client information or company secrets into tools not approved for them.
- Version the source document and application files. Changes to facts in the Career KB require the owner's confirmation.
- Add statuses to the sheet deterministically. On write errors, show what was done and what was not; **never claim a file was saved without confirmation**.
- Weekly audit: duplicates, falsely "active" offers, wrong alerts, CVs over 2 pages, missing URLs, inconsistent statuses, unverified claims.

## 13. KPIs and operating rhythm

**Daily (5–10 min):** new verified offers; decisions needed; follow-ups due today; missing replies.

**Weekly (20–30 min):** number of genuinely new qualifying offers, approved applications, replies, interviews, conversion to interview, offer quality, sources of hits, CV creation time, dedup errors and backlog.

**Weekly (about 60 min) — new in 1.1:** one mock interview, logged in `Mock_Interview_Log.md`.

**Every 4–6 weeks — new in 1.1:** repeat the market scan (5.1) for active role families; update the ✅/⚠️/❌ statuses and the Master CV.

**Practical metrics:** `Response Rate = replies / applications sent`, `Interview Rate = invitations / applications sent`, `Duplicate Alert Rate = wrong repeat alerts / all alerts`, `CV QA Pass Rate = CVs passing the checklist / CVs generated`, `Mock cadence = weeks with a mock interview / weeks of searching`. Treat small samples as indicative; do not draw firm conclusions from a few applications.

**Decision review:** every unsuccessful process can give a concrete correction to the profile, offers or answers. Do not "stretch" the CV to requirements the candidate does not meet.

## 14. Onboarding acceptance criteria

- [ ] One root folder, nine folders 00–08 and the minimum files created.
- [ ] The candidate's own data, with no one else's name, phone, email or links.
- [ ] Market scan done for every role family; requirements from ≥5/10 ads have a status and a next step.
- [ ] Master CV separated from the tailored CVs.
- [ ] The Tracker has three tabs with the agreed headers and real links.
- [ ] The assistant can read both registers before a new search.
- [ ] Running the same offer again creates no extra record or alert.
- [ ] A green offer produces a CV in a separate Google Doc, with the link in the Tracker.
- [ ] The PDF, looked at page by page, confirms max 2 pages, bold down to the last character, links and layout.
- [ ] Applications are marked as sent only on confirmation.
- [ ] A lost Google connection does not lead to a fake save or fake deduplication.
- [ ] A weekly mock interview and the weekly review are in the calendar.
- [ ] The candidate can easily export the data and close the project.

## 15. Who is responsible for what (practical RACI)

**Candidate:** approves the profile, achievements, requirement statuses in the market scan, target roles, offers and the final CV; authorises sending; gives feedback from interviews. **AI assistant:** searches, analyses, compares, drafts CVs and messages, keeps the registers after confirmed operations, runs mock interviews, flags risks. **Drive/Sheets:** keep the durable record. **Source ATS:** confirms activity, conditions and the actual application. **Automation:** runs repeatable reads and reports but does not take over responsibility for the candidate's decisions.

## 16. Practical prompts — quick reference

### 16.1 Offer analysis

> Analyse this offer against my Master CV, Career Knowledge Base, Market Requirements and profile. First verify the active form and check `Offer Memory` and `Job Tracker`. Give: a green/yellow/red verdict, match %, 3 matches, 3 risks, positioning, 3–5 concrete CV changes, interview arguments, a short outreach message and the next step. Mark unconfirmed facts; do not invent experience. Save the analysis in the tracker if you have access, and confirm it was done. Offer: [LINK/TEXT]

### 16.2 Tailored CV

> Prepare a separate Google Doc CV for the offer [LINK], based on the Master CV and confirmed facts only (✅ statuses in Market Requirements). Do not change the Master CV. ATS-friendly, one column, max 2 pages, Aptos 10.5, section and role headings bold in full, the whole header block centred, live LinkedIn/portfolio/GitHub, the right legal clause. Apply styles after the last text change. Export the PDF after the last edit, look at both pages, fix, and only then save the link in Job Tracker. Do not mark the application as sent.

### 16.3 New offer scan

> Find new active offers that match my roles and constraints. Before searching, read both `Job Tracker` and `Offer Memory`. Start with ads from the last 24–72 hours and the sources in Search_Policy. Block exact, likely and semantic duplicates. For new offers, check the original form, location, pay, hours and legal availability, then write to Offer Memory before reporting. If the read/write fails, do not claim the offer is new; report the error.

### 16.4 Follow-up

> Check applications sent 5–7 days ago with no reply. Do not confuse a prepared CV with a sent application. Draft a natural follow-up of at most 4 sentences that mentions one specific thing from the ad. Do not send without my approval.

### 16.5 Mock interview

> Run a mock interview for the role [ROLE] at [COMPANY] based on the ad, the note on this company's hiring process and my real projects. Ask one question at a time. After each answer give: ✅ What worked, ⚠️ What was weak, 💡 A better version to use. Watch for STAR and conciseness; add nothing without data. At the end, add an entry to Mock_Interview_Log: the weakest answer and one thing to improve.

### 16.6 Weekly review

> Read the current Job Tracker, summarise the pipeline, applications needing follow-up, interviews, risks and missing documents. Check whether there was a mock interview this week. Name the three most important actions for next week. Do not change statuses based on assumptions.

### 16.7 Market scan (new in 1.1)

> Run a market scan for the role family [ROLE] in [LOCATION/MODE]. Find 10 active ads from the last 30 days, from different companies (max 2 per company), using the sources in Search_Policy. List requirements in the ads' own words and count how many of the 10 mention each. For every requirement in ≥3/10, propose a status based on the Career Knowledge Base: ✅ have it with evidence (name the evidence), ⚠️ have it without evidence, ❌ missing — never mark ✅ without evidence. Save the result in a copy of Market_Requirements_TEMPLATE.md, add the pay ranges from the ads and the 3 main gaps. I will approve the statuses.

### 16.8 Company hiring process (new in 1.1)

> Find out what the hiring process at [COMPANY] looks like for the role [ROLE] or a similar one: stages, format, task and question types, duration. Use the career page, the ad text and candidate reports from the last 12 months only; give the source and date for each piece of information. Separate facts from single reports. Save the result in a copy of Company_Process_TEMPLATE.md and propose 3 practice tasks of that type.

## 17. Origin, changes and licence

**Baseline (verified 19.11.2026):** a real, personal job search system run in 2026: a prompts and workflow document, a workbook with `Job Tracker`, `Offer Memory` and `Search Rules` tabs, a folder with `00–08` subfolders, a `Career Knowledge Base` and an anti-duplicate procedure. The CV methodology, statuses, 5–7 day follow-up and dedup gate come from these materials.

**Version 1.0 recommendations for the portable edition:** `Candidate_Profile.yaml`, standardised onboarding, proposed scoring weights, separate main and side-gig search tracks, KPIs, a responsibility matrix, templates and a data-transfer safety check.

**Changes in version 1.1 (24.11.2026):** market scan before the CV (`Market_Requirements_TEMPLATE.md`, step 2, prompt 16.7); a "Done when…" check for every onboarding step; a weekly mock interview in the rhythm (`Mock_Interview_Log.md`); researching the company's hiring process (`Company_Process_TEMPLATE.md`, prompt 16.8); a list of sources and search tactics in `Search_Policy.md`; lessons on CV formatting in Google Docs and a contact-free CV variant for freelance platforms; project instructions that work in ChatGPT and Claude (`Project_Instructions.md`). Some ideas (start with the ads, not the CV; practise for a specific company; a weekly mock interview; ad freshness) were inspired by a public job-search checklist by matkowski.ai (as of 14.10.2026); the text is written from scratch.

**Licence / use:** MIT. This document is a guide for self-service use. When deploying, use only **your own data and your own links**. Do not copy recruitment history, contact details, CVs or information from other accounts.

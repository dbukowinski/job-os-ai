# JOB OS — Opportunity Memory & Deduplication (universal)

## Required preflight
- Read the current `Job Tracker` and `Offer Memory` (not chat recollection).
- Preserve row IDs, statuses and URLs.
- If either read fails, stop any definitive "new opportunity" alert.

## Identity / normalisation
- Remove UTM/fbclid/gclid/trk and the URL fragment; preserve the ATS job ID / UUID.
- Build a canonical company + specific role key; do not erase meaningful specialisation.
- Exact: ATS ID / canonical URL match → same record.
- Likely: employer, title, project, seniority, requirements, schedule → verify manually.
- Semantic: another portal/agency, similar employer/project/description → investigate, no alert until resolved.
- Different roles at the same employer may be separate records; do not merge blindly.

## Record responsibilities
- `Offer Memory`: ALL seen, applied, rejected, closed, prepared and talent-pool opportunities. Stable JOB-#### and first-seen date.
- `Job Tracker`: genuinely evaluated/applied opportunities and application status. `Sent` only on proof.
- Do not rewrite application status based on plausible inference.

## Publish gate
- Original application route confirmed active.
- Eligibility from the user's country / remote and hours verified or explicitly marked unknown.
- Skills + operational fit meets the track threshold (default for side gigs: 80%).
- Duplicate checks passed against BOTH tabs.
- New Memory row persisted and read back before the alert.
- If any gate fails, no definitive new-opening alert.

## QA
Weekly audit of reported duplicates, missed qualified postings, closed offers, failed verification and false assumptions.

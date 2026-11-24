# JOB OS — uniwersalny system poszukiwania pracy wspierany przez AI

**Metodologia, architektura, struktura folderów, reguły jakości i instrukcja wdrożenia dla nowego kandydata**
Wersja 1.1 | 24 listopada 2026 | Dokument do przekazania / adaptacji

> **Zasada główna:** projekt AI (ChatGPT albo Claude) jest centrum operacyjnym, ale Google Drive i rejestry są źródłem prawdy. AI przygotowuje i zapisuje artefakty; kandydat kontroluje decyzje, informacje o sobie i faktyczne wysłanie zgłoszenia.

> **Jak czytać ten dokument:** na start wystarczy `README.md` w głównym folderze paczki (8 kroków z kryterium „Działa, gdy…”). Ten playbook to dokumentacja: wracasz do niego, gdy chcesz zrozumieć, dlaczego coś działa tak, a nie inaczej.

## 1. Czym jest JOB OS?

JOB OS to osobisty system zarządzania karierą. Łączy projekt AI (ChatGPT Project albo Claude Project), Google Drive, dokumenty Google Docs, arkusz Google Sheets, przeglądanie aktualnych ogłoszeń i opcjonalne harmonogramy. Zamiast chaotycznie wysyłać CV, prowadzi powtarzalny proces: **profil → przegląd rynku → baza faktów → wyszukanie → weryfikacja aktywności → kontrola duplikatów → ocena → decyzja → CV → aplikacja → follow-up → rozmowa → wnioski**.

Działa dla BA, programisty, marketingowca, analityka danych, PM-a, specjalisty sprzedaży i każdej innej roli. Przenosimy **mechanikę i standardy**, nie biografię ani osiągnięcia pierwotnego użytkownika.

**Cele operacyjne:** mniej niepasujących aplikacji; CV zbudowane na wymaganiach, które naprawdę powtarzają się w ogłoszeniach; szybkie CV pod wybrane oferty; brak ponownego raportowania tych samych ofert; historia decyzji; regularny trening rozmów; czytelny obraz pipeline'u.

**Ważne rozróżnienie:** elementy sprawdzone w pierwotnym systemie oznaczono „stan bazowy”. Propozycje i szablony dla kolejnej osoby oznaczono „rekomendacja”.

## 2. Architektura i odpowiedzialność

```text
KANDYDAT (zatwierdza dane i decyzje)
 |
 v
PROJEKT AI „JOB” (ChatGPT albo Claude) — interfejs, analiza, drafting, operacje
 |
 +-- Google Drive ────────────────────────────────────+
 |   Workflow / Project Instructions                  |
 |   Master CV (tylko odczyt) + Career Knowledge      |
 |   Market Requirements (przegląd rynku)             |
 |   Google Sheets: Job Tracker / Offer Memory / Rules|
 |   Google Docs: CV pod ofertę i materiały rozmów    |
 +-- Web / ATS / strony firm — aktualne oferty
 +-- Gmail / Calendar (opcjonalnie i po upoważnieniu)
 +-- Automations — cykliczne kontrole, przypomnienia
```

**Jeden system, różne role danych:**
- **Master CV:** baza zatwierdzonych faktów i historii zawodowej; nie nadpisywać przy aplikacjach.
- **Career Knowledge Base:** szczegółowe przykłady projektów, osiągnięcia, dowody, technologie z poziomem biegłości, ograniczenia, historie STAR.
- **Market Requirements:** wymagania, które powtarzają się w ogłoszeniach na wybrane role, ze statusem: mam z dowodem / mam bez dowodu / brak.
- **Workflow / Project Instructions:** reguły zachowania asystenta, etapy, polityki jakości i warunki bezpieczeństwa.
- **Job Tracker:** jedyne operacyjne źródło prawdy o statusie aplikacji, dacie wysłania, CV i follow-upie.
- **Offer Memory:** pamięć wszystkich zobaczonych ogłoszeń (także odrzuconych); zapobieganie duplikatom.
- **Search Rules:** skrócona polityka monitoringu, kryteria publikowania i fallback.
- **Chat:** wygodny front-end, ale **nie** długoterminowy rejestr.

**Uprawnienia:** AI może czytać dane i przygotowywać materiały. Edycja Trackera i tworzenie dokumentów to operacje audytowalne. Wysłanie aplikacji, maila lub wiadomości musi być świadome, autoryzowane i potwierdzone; samo przygotowanie CV nie oznacza wysłania aplikacji.

## 3. Struktura katalogów w Google Drive

Stan bazowy: jeden folder główny i **dziewięć katalogów numerowanych od 00 do 08**. Używaj jednego kanonicznego folderu projektu i jednego trackera — bez równoległych kopii.

```text
Job_OS_[Imie_Nazwisko]/
├── README.md                                 [start: 8 kroków]
├── 00_Workflow_and_Prompts/
│   ├── JOB_OS_Playbook.md                    [ten dokument]
│   ├── Project_Instructions.md               [tekst do instrukcji projektu AI]
│   ├── Candidate_Profile_TEMPLATE.yaml       [konfiguracja kandydata]
│   ├── Career_Knowledge_Base.md              [zweryfikowane historie i dowody]
│   ├── Market_Requirements_TEMPLATE.md       [przegląd rynku: 10 ogłoszeń na rodzinę ról]
│   ├── Search_Policy.md                      [źródła, monitoring i scoring]
│   ├── CV_QA_Checklist.md                    [kontrola ATS, Google Docs i PDF]
│   └── Opportunity_Memory_Dedup_SKILL.md     [reguły antyduplikatowe]
├── 01_Master_CV/
│   ├── [Imie_Nazwisko]_Master_CV.docx        [nietykalna baza]
│   ├── [Imie_Nazwisko]_Master_CV.pdf         [wersja referencyjna]
│   └── Evidence_and_Certifications/          [opcjonalnie: dowody, portfolio]
├── 02_Application_Tracker/
│   └── JOB_Application_Tracker               [Google Sheets: 3 zakładki]
├── 03_Job_Offers_Raw/
│   └── YYYY-MM-DD_[Firma]_[Rola].md          [treść, źródło, data]
├── 04_Custom_CV_Google_Docs/
│   └── [Imie_Nazwisko]_CV_[Firma]_[Rola]_YYYY [Google Doc]
├── 05_Custom_CV_PDF_DOCX/
│   ├── [Imie_Nazwisko]_CV_[Firma]_[Rola]_YYYY.pdf
│   └── [Imie_Nazwisko]_CV_[Firma]_[Rola]_YYYY.docx
├── 06_Recruiter_Messages/
│   ├── Outreach_Templates.md
│   └── YYYY-MM-DD_[Firma]_[Rola]_Messages.md
├── 07_Interview_Prep/
│   ├── STAR_Stories.md
│   ├── Mock_Interview_Log.md                 [próbna rozmowa co tydzień]
│   ├── Company_Process_TEMPLATE.md           [jak rekrutuje konkretna firma]
│   └── YYYY-MM-DD_[Firma]_[Rola]_Interview.md
└── 08_Archive/
    └── [odrzucone stare wersje i zamknięte materiały]
```

Nazwy dziewięciu folderów pochodzą ze stanu bazowego. Nazwy plików w środku są **proponowanym standardem**.

### Konwencja nazewnicza

`YYYY-MM-DD_Firma_Rola_Typ_vNN` dla roboczych notatek. Dla CV: `[Imie_Nazwisko]_CV_[Firma]_[Rola]_[Rok]`; nazwa może zawierać język `PL/EN`. Unikać `final_v3_nowy_poprawiony`. Stabilny `JOB-0001` z Offer Memory powinien występować w nazwie notatki lub metadanych, gdy trzeba śledzić wersje.

## 4. Inwentarz plików: minimum i rozszerzenie

**Wymagane do MVP:**
1. `Project_Instructions.md` — instrukcje ustawione w projekcie AI.
2. `Master_CV` — zaakceptowane CV bazowe.
3. `Career_Knowledge_Base.md` — fakty, case studies i luki.
4. `Market_Requirements.md` — przegląd rynku dla każdej rodziny ról (kopia szablonu).
5. `JOB_Application_Tracker` — Google Sheets z `Job Tracker`, `Offer Memory`, `Search Rules`.
6. `CV_QA_Checklist.md` — bramka jakości każdego dokumentu.

**Warto dodać później:** `Candidate_Profile_TEMPLATE.yaml`, `Search_Policy.md`, `Opportunity_Memory_Dedup_SKILL.md`, `STAR_Stories.md`, `Mock_Interview_Log.md`, `Company_Process_TEMPLATE.md`, szablony outreach i raport tygodniowy. Na start nie trzeba bazy SQL, vector store ani narzędzia ATS: arkusz wystarcza do osobistego wolumenu.

## 5. Onboarding nowej osoby — kolejność wdrożenia

Każdy krok kończy się kryterium **„Działa, gdy…”**. Nie przechodź dalej, dopóki kryterium nie jest spełnione.

**Krok 1. Profil i cele (30–60 min).** Wybierz 2–4 rodziny ról; zbierz lokalizacje, języki, model zatrudnienia (UoP/B2B/kontrakt), widełki, dostępność, tryb zdalny/hybrydowy, branże i role wykluczone. Ustal, czy celem jest praca główna, czy dodatkowe zlecenia. Zapisz w `Candidate_Profile_TEMPLATE.yaml`.
*Działa, gdy* profil ma role docelowe, warunki (model, stawka, godziny, lokalizacja) i listę wykluczeń.

**Krok 2. Przegląd rynku przed CV (60–90 min na rodzinę ról) — nowość w 1.1.** Zbierz 10 aktywnych ogłoszeń z ostatnich 30 dni na każdą rodzinę ról. Wypisz wymagania, które się powtarzają, i policz, w ilu ogłoszeniach padają. Każdemu wymaganiu nadaj status z Career KB: ✅ mam z dowodem, ⚠️ mam bez dowodu, ❌ brak. Wynik zapisz w `Market_Requirements.md` (kopia szablonu). Szczegóły w 5.1.
*Działa, gdy* każde wymaganie, które pada w co najmniej 5 z 10 ogłoszeń, ma status i następny krok.

**Krok 3. Baza faktów (1–2 h).** Wgraj CV, LinkedIn/GitHub/portfolio, opis projektów i certyfikaty. Oddziel fakty potwierdzone, deklarowane oraz luki do wyjaśnienia. Dla wymagań ⚠️ z kroku 2 poszukaj dowodu (projekt, artefakt, opinia, certyfikat) i dopisz go do Career KB albo zostaw ⚠️. Nie przypisuj osiągnięć innych osób. Zapisz Master CV jako tylko-do-odczytu.
*Działa, gdy* Master CV leży w `01_Master_CV/`, a każde wymaganie ✅ ma w Career KB wskazany dowód.

**Krok 4. Drive i tracker (20–30 min).** Utwórz drzewo z rozdziału 3, wgraj pakiet plików, zaimportuj pusty szablon `.xlsx` do Google Sheets jako nowy arkusz, uzupełnij linki wewnętrzne.
*Działa, gdy* w Google Sheets są trzy zakładki o dokładnych nazwach `Job Tracker`, `Offer Memory`, `Search Rules`.

**Krok 5. Projekt AI (15 min).** Utwórz projekt `Job — [Imię]` w ChatGPT albo w Claude; wklej `Project_Instructions.md` do instrukcji projektu; podmień `[URL_...]` na linki do **własnych** dokumentów; podłącz Google Drive.
*Działa, gdy* asystent zapytany „ile wierszy ma Offer Memory?” odczytuje arkusz i podaje liczbę (na starcie 0), zamiast zgadywać.

**Krok 6. Test kontrolny (20 min).** Wklej jedną aktywną ofertę; sprawdź analizę, zapis w Memory, zapis w Trackerze, wygenerowane CV, linki i status. Wklej tę samą ofertę ponownie.
*Działa, gdy* druga próba nie tworzy nowego wiersza ani alertu, a CV przechodzi `CV_QA_Checklist.md`.

**Krok 7. Rytm tygodnia (10 min) — nowość w 1.1.** Wpisz do kalendarza: codzienny przegląd 5–10 min, cotygodniowy przegląd pipeline'u 20–30 min i **jedną próbną rozmowę w tygodniu** (ok. 60 min) aż do prawdziwej rozmowy. Szczegóły w 13.
*Działa, gdy* trzy terminy stoją w kalendarzu jako powtarzalne wydarzenia.

**Krok 8. Monitoring (opcjonalnie).** Dopiero po pomyślnym kroku 6. Dodaj harmonogram, jeśli potrzebny; nigdy nie ogłaszaj ofert jako nowych bez sprawdzenia obu rejestrów.
*Działa, gdy* pierwszy automatyczny przebieg czyta obie zakładki i nie zgłasza jako nowej żadnej oferty, która już jest w Offer Memory.

### 5.1 Przegląd rynku — jak to zrobić

1. **Źródła:** strony kariery firm i portale z `Search_Policy.md`. Bierz tylko aktywne ogłoszenia z ostatnich 30 dni, z różnych firm (max 2 z jednej).
2. **Wypisz wymagania słowami z ogłoszeń** (np. „BPMN”, „SQL”, „praca z interesariuszami”), nie własnymi synonimami — po tych słowach filtruje ATS i rekruter.
3. **Policz częstotliwość:** w ilu z 10 ogłoszeń pada wymaganie. Rdzeń roli to wymagania z ≥5/10; 3–4/10 to „często”; rzadsze pomiń.
4. **Nadaj status** na podstawie Career KB, nie deklaracji: ✅ mam z dowodem, ⚠️ mam bez dowodu, ❌ brak.
5. **Następny krok:** ✅ → te słowa trafiają do Summary, Skills i punktów doświadczenia; ⚠️ → dopisz dowód albo historię STAR; ❌ → zdecyduj: uczysz się i robisz mały projekt do pokazania, pokazujesz kompetencję pokrewną albo uczciwie mówisz o luce. **Nigdy nie wpisuj ❌ do CV jako umiejętności.**
6. **Widełki:** zapisz zakres stawek z ogłoszeń (min–max, forma umowy). Przyda się do profilu i rozmowy o pieniądzach.
7. **Powtórka:** co 4–6 tygodni albo przy zmianie rodziny ról.

Przegląd rynku wykonuje asystent na żądanie (prompt 16.7), ale statusy ✅/⚠️/❌ zatwierdza kandydat.

## 6. Model danych — trzy zakładki jednego arkusza

### 6.1 Job Tracker (stan bazowy, 17 kolumn A:Q)

```text
A Data znalezienia
B Firma
C Stanowisko
D Link do oferty
E Źródło
F Status
G Werdykt
H Dopasowanie %
I Najważniejsze wymagania
J Mocne dopasowania
K Ryzyka / braki
L Pozycjonowanie
M Co zmienić w CV
N Wersja CV
O Wiadomość do rekrutera
P Data aplikacji
Q Follow-up / Uwagi
```

**Semantyka:** kolumna F wyraża rzeczywisty etap; P jest datą **potwierdzonego wysłania** aplikacji, nie datą stworzenia CV. Wersja CV w N zawiera bezpośredni link do odpowiedniego Google Doc albo najnowszego sprawdzonego PDF. W uwagach można przechować datę następnego follow-upu, historię i decyzje. Aktualizacje istniejącego ogłoszenia robić w istniejącym wierszu.

**Statusy:** `Do analizy`, `Do decyzji`, `CV przygotowane`, `Gotowe do wysłania`, `Wysłane`, `Follow-up`, `Rozmowa HR`, `Rozmowa techniczna`, `Oferta`, `Odrzucone`, `Wycofane`, `Zamknięte`. Nie przełączaj na `Wysłane` bez potwierdzenia. Przy `Follow-up` weryfikuj, czy była aplikacja, czy jedynie kontakt z rekruterem.

### 6.2 Offer Memory (stan bazowy, 17 kolumn A:Q)

```text
A Offer ID
B Firma
C Stanowisko
D Canonical key (firma+rola)
E URL kanoniczny
F Alternatywne URL
G Pierwsza obserwacja
H Ostatnia weryfikacja
I Status w pamięci
J Status w Application Tracker
K Dopasowanie %
L Godz./tydz. (potwierdzone)
M Sygnatura semantyczna / wymagania
N Klaster
O Wiersz w Job Tracker
P Źródło
Q Uwagi / powody blokady
```

Każda znaleziona oferta otrzymuje stabilny identyfikator `JOB-0001`, `JOB-0002` itd., **nawet jeśli została odrzucona albo nigdy nie trafiła do procesu aplikacyjnego**. Jedna rekrutacja = jeden rekord. `Offer Memory` nie jest bazą wektorową; zawiera identyfikatory, normalizację, sygnaturę tekstową i wynik weryfikacji podobieństwa.

**Statusy pamięci:** `SEEN`, `REPORTED_NOT_APPLIED`, `PREPARED_NOT_CONFIRMED`, `APPLIED`, `REJECTED`, `CLOSED`, `TALENT_POOL`, `DUPLICATE_REVIEW`. Status w pamięci i status aplikacji nie są automatycznie tym samym.

### 6.3 Search Rules (stan bazowy, 4 kolumny A:D)

`SEKCJA | REGUŁA | DZIAŁANIE | UWAGA`. Zawiera m.in.: nadrzędność statusu w `Job Tracker`, konieczność czytania obu zakładek, normalizację URL, semantic matching, weryfikację aktywności, kolejność źródeł i świeżość ogłoszeń (nowość w 1.1), regułę publikacji, fallback przy błędach i audyt tygodniowy.

## 7. Proces od oferty do decyzji

### Etap 0 — Preflight: nie wyszukuj „nowości” w ciemno

Odczytaj metadane Trackera (nazwy kart, używany zakres), potem `Job Tracker` i `Offer Memory`. Zachowaj numer wiersza, URL, firmę, stanowisko, status. Bez odczytu obu tabel system nie może twierdzić, że oferta jest nowa; w monitoringu automatycznym należy wstrzymać alert i zgłosić problem.

### Etap 1 — Znalezienie i potwierdzenie aktywności

Kolejność źródeł: strony kariery firm i ich systemy ATS (np. Greenhouse, Lever, Ashby, Workable, Teamtailor), potem portale z `Search_Policy.md`, potem kontakty. Zaczynaj od ogłoszeń z ostatnich 24–72 godzin: na starsze spłynęło już dużo zgłoszeń. Lepiej codziennie sprawdzać dwa dobrze dobrane źródła niż raz na tydzień pięć.

Otwórz docelowy link i zweryfikuj, że formularz nadal przyjmuje aplikacje. Osobno oznacz: `aktywna`, `zamknięta`, `niepotwierdzona` i `talent pool`. Ogłoszenie widoczne w agregatorze nie dowodzi aktywności formularza.

### Etap 2 — Deduplikacja (twarda blokada)

Porównaj: (1) identyfikator oferty w ATS lub kanoniczny URL, (2) znormalizowaną firmę i rolę, (3) semantycznie zbliżone wymagania, zakres, seniority, czas pracy, lokalizację, wynagrodzenie i link. Usuń parametry śledzące (`utm_*`, `gclid`, `fbclid`, `trk`), ale zachowaj identyfikatory `job_id`/UUID. Ta sama firma i podobny tytuł nie zawsze oznaczają ten sam proces. Gdy podobieństwo jest wysokie i nierozstrzygnięte — oznacz `DUPLICATE_REVIEW`, nie alarmuj jako nowej.

### Etap 3 — Filtry brzegowe i dopasowanie

**Hard gates:** legalna możliwość pracy w kraju/regionie, nieakceptowalny model pracy, obowiązkowe licencje/uprawnienia, zbyt duża kolizja godzin, faktycznie zamknięty formularz. Dla dodatkowych kontraktów rozróżniaj 10–20 h/tydz. od pełnego etatu; `remote` nie jest równoznaczne z „praca z Polski”.

Dla każdej oferty podaj dopasowanie 0–100%, werdykt `🟢 aplikować`, `🟡 po dopasowaniu`, `🔴 odpuścić`, **trzy atuty i trzy ryzyka**, pozycjonowanie, zmiany w CV, argument na rozmowę, zwięzły outreach i następny krok. Przy wymaganiach korzystaj ze statusów z `Market_Requirements.md`: wymaganie ❌ to ryzyko, nie słowo kluczowe do CV.

**Rekomendowany, opcjonalny algorytm scoringu:** umiejętności 40%, domena 15%, seniority/odpowiedzialność 15%, tryb i dostępność 15%, wynagrodzenie 10%, kierunek kariery 5%. Każde kryterium oceniaj 0–1, licz wagowo. Nieznanych warunków nie oznaczaj jako spełnionych; pokaż poziom pewności. Twarda blokada może przeważyć nawet wysoką punktację.

### Etap 4 — Zapis historii i decyzja

Każdą naprawdę nową obserwację wpisz **najpierw** do `Offer Memory` i zweryfikuj odczytem. Do `Job Tracker` wpisuj oferty pełniej analizowane, wybrane do aplikacji lub już obsługiwane. Pamięć ofert i tracker nie mogą mieć sprzecznych statusów; przy konflikcie źródłem prawdy o zgłoszeniu jest `Job Tracker`.

### Etap 5 — Dedykowane CV

Dla zielonych i mocnych żółtych ofert stwórz **nowy Google Doc**, korzystając z Master CV, Career KB i `Market_Requirements.md`. Dopasuj Summary, Skills i wybrane punkty doświadczenia słowami z ogłoszenia, ale tylko tam, gdzie jest dowód (✅). Zachowaj prawdziwe daty, tytuły, zakres odpowiedzialności i poziom biegłości narzędzi. Zapisz link w kolumnie `Wersja CV`. Nigdy nie modyfikuj Master CV w celu pojedynczej aplikacji.

### Etap 6 — QA, eksport i wysłanie

Sprawdź poprawność merytoryczną i format według `CV_QA_Checklist.md`. Style (pogrubienia, rozmiary) nakładaj po ostatniej zmianie treści i sprawdzaj każdy nagłówek do ostatniego znaku. Eksportuj PDF **po ostatniej edycji** i obejrzyj każdą stronę — liczba akapitów nie mówi, jak wygląda PDF. Eksportuj PDF oraz opcjonalnie DOCX. Kandydat wysyła przez formularz lub udziela wyraźnej zgody na wykonanie tej operacji. Dopiero po potwierdzeniu uzupełnij `Data aplikacji` i `Status = Wysłane`.

### Etap 7 — Outreach, follow-up i rozmowa

Przygotuj krótką wiadomość dopasowaną do konkretu z ogłoszenia, bez masowych wstępów. Po ok. 5–7 dniach od wysłania, jeśli brak reakcji i jest sens kontaktu, zaproponuj follow-up; nie wysyłaj powtórki bez potwierdzenia.

Przed rozmową (nowość w 1.1):
1. **Sprawdź, jak rekrutuje ta firma:** etapy, format, typy zadań i pytań. Źródła: strona kariery, opisy procesu w ogłoszeniu, relacje kandydatów (np. Glassdoor) — **tylko z ostatnich 12 miesięcy**, ze źródłem i datą. Zapisz w kopii `Company_Process_TEMPLATE.md`.
2. **Ćwicz na zadaniach tego typu**, jakie daje ta firma. Przygotowanie pod jedną firmę jest krótsze i skuteczniejsze niż ogólne.
3. Przygotuj pitch 60–90 sekund, 3–5 historii STAR, pytania do firmy i ryzyka.
4. Prowadź mock interview **jedno pytanie na raz**, następnie `co działało / co słabe / lepsza odpowiedź`.

### Etap 8 — Zamknięcie i lekcje

Zachowaj status `Odrzucone`, `Zamknięte`, `Oferta`, `Wycofane` i notatkę z feedbackiem; nie kasuj śladów. Raz w tygodniu sprawdź pipeline, zaległe follow-upy, skuteczność kanałów i jakość dopasowania. Wnioski, które się powtarzają (np. ten sam brak w trzech rekrutacjach), wracają do `Market_Requirements.md` i Career KB.

## 8. Standard CV i bramka jakości

Poniższy standard jest bazą metodyki; szata graficzna może być parametrem profilu nowej osoby. Nie kopiuj imienia, adresu, telefonu, linków ani branż innego kandydata.

**Format bazowy:** maksymalnie 2 strony, jedna kolumna, ATS-friendly, bez tabel, ikon, sidebarów i grafik. Font Aptos 10.5 pt; sekcje 12–14 pt, pogrubione; interlinia 1.0–1.15; kompaktowe czytelne marginesy; zwykłe punkty. Nagłówek (imię, tytuł, kontakt, LinkedIn/portfolio/GitHub, gdy występują) wyśrodkowany. Linki muszą być aktywne.

**Nagłówki sekcji:** pogrubione. **Każdy nagłówek stanowiska:** pogrubiony w całości, np. `Senior Analyst | Firma — projekt / kontekst klienta`. Nie używać sztucznych liczników sukcesu. Słowa kluczowe ATS muszą wynikać z realnego doświadczenia (status ✅ w `Market_Requirements.md`).

**Kolejność skracania, jeśli CV przekracza 2 strony:** (1) poboczne projekty nieadekwatne do ogłoszenia, (2) starsze, mniej istotne role, (3) długa lista narzędzi, (4) drugorzędne punkty doświadczenia, (5) powtórzenia Summary/Skills. Nie obniżać bazowego fontu, żeby zmieścić treść.

**Znane pułapki Google Docs (lekcje z praktyki, nowość w 1.1):**
- Style nakładaj dopiero po wszystkich zmianach tekstu — podmiana tekstu potrafi rozbić zakres i zdjąć pogrubienie z ostatniej litery.
- Pogrubiaj cały akapit nagłówka, łącznie z ostatnim znakiem, i sprawdź ten ostatni znak w gotowym dokumencie (typowy błąd: niepogrubione ostatnie „S” albo „)”).
- Nie układaj umiejętności w długie listy rozdzielone `|` — po zawinięciu wiersza `|` wisi na początku linii. Używaj krótkich fraz po przecinku lub średniku.
- Nie rób odstępów pustymi akapitami; nagłówek roli trzymaj razem z datami i punktami (`keep with next`).
- Sukces zapisu przez API nie oznacza poprawnego wyglądu — decyduje obejrzany PDF.

**Wariant bez danych kontaktowych:** niektóre platformy freelance (np. Upwork) zabraniają kontaktu poza platformą przed zawarciem umowy. Dla nich przygotuj osobny wariant CV bez maila, telefonu i linków kontaktowych; sprawdź treść i PDF. Master CV zostaje bez zmian.

**GDPR / RODO:** na dole dokumentu mały, jasnoszary tekst (w modelu bazowym 8–8.5 pt) bez osobnego nagłówka. Treść i potrzebę klauzuli dostosuj do kraju, wymagań pracodawcy i wersji językowej. Przykładowa anglojęzyczna formuła jest w `CV_QA_Checklist.md`; to nie jest porada prawna.

**QA 3×:** sprawdzenie faktów → kontrola formatowania dokumentu → obejrzenie finalnego PDF. Zawsze kontroluj nazwisko i znaki diakrytyczne, wyśrodkowanie nagłówka, pogrubienia do ostatniego znaku, aktywne linki, maksymalnie dwie strony, położenie GDPR i poprawny link w trackerze (najnowszy sprawdzony PDF; starsze wersje oznaczone jako zastąpione).

## 9. Pozycjonowanie, wiadomości i trening rekrutacyjny

**Profile alternatywne:** dla każdej rodziny ról zdefiniuj `value proposition`, mocne potwierdzone projekty, słowa kluczowe z uzasadnieniem (z `Market_Requirements.md`) i największe luki. Osoba zmieniająca stanowisko nie powinna udawać, że już pełniła nową rolę: należy pokazywać **kompatybilne obowiązki i gotowość do przejścia**.

**Outreach:** 400–700 znaków, 1–2 konkrety z oferty, jeden mocny argument profilu, miękkie CTA. Unikaj „I hope this message finds you well”, nie przepisuj CV ani nie opowiadaj całej biografii. Dopasuj język do rekrutera.

**Mock interview:** jedno pytanie → odpowiedź kandydata → `✅ Co działało`, `⚠️ Co było słabe`, `💡 Lepsza wersja`. Dla doświadczeń używaj STAR (Situation, Task, Action, Result). Wynik ma być zgodny z faktami; brak danych liczbowych to nie powód do ich wymyślania.

**Próbna rozmowa co tydzień (nowość w 1.1):** jedna próbna rozmowa w tygodniu, stały termin, ok. 60 minut, aż do prawdziwej rozmowy — a nie jedna dzień przed. Może być z AI, z drugą osobą albo w serwisie z próbnymi rozmowami. Jeśli to możliwe, nagraj ją i odsłuchaj następnego dnia: najczęściej słychać wtedy, że kandydat myśli w ciszy albo mówi za długo. Każdą rozmowę zapisz w `Mock_Interview_Log.md` z jedną rzeczą do poprawy na następny raz.

## 10. Monitoring i automatyzacje

**Dwie osobne ścieżki:**
- `Main Career Search`: oferty główne, stawki, lokalizacja i kierunek kariery.
- `Side Gigs / Part-time`: płatne kontrakty, np. 10–20 h/tydz., freelance fixed-scope 2–4 tygodnie, AI Trainer/Evaluator lub konsulting. Tu wymagane są dodatkowe filtry godzin, kolizji i kraju. W stanie bazowym alert wymagał **łącznego dopasowania ≥80%**, potwierdzenia aktywności i zapisu do pamięci ofert przed publikacją.

**Każdy przebieg automatyzacji:** (0) połączenie i odczyt Trackera+Memory; (1) search wielu źródeł, od najświeższych; (2) aktywność; (3) dedup; (4) warunki kandydata; (5) scoring; (6) zapis Memory i readback; (7) dopiero wtedy powiadomienie. Jeśli narzędzia Google są niedostępne, nie zgłaszać, że nowa oferta na pewno nie była wcześniej widziana. Alert może być wstrzymany.

**Kalendarz działania (rekomendacja):** skan codzienny w dni robocze lub codziennie, cotygodniowy backfill aktywnych starszych ogłoszeń, przegląd pipeline'u raz na tydzień, propozycja follow-upu po 5–7 dniach. Harmonogram dostosować do osoby; nie tworzyć automatyzacji bez jej zgody.

**Czego nie wolno automatyzować bez zgody:** masowego aplikowania, wysyłania outreach, przekazywania prywatnego CV nieznanym podmiotom, zmiany statusu na `Wysłane`, publikowania wrażliwych danych.

## 11. Antyduplikaty — algorytm i zasady idempotencji

```text
INPUT: znaleziona oferta
PRECONDITION: odczyt Job Tracker + Offer Memory zakończony sukcesem
normalize_url(): usuń tracking, zachowaj identyfikatory ogłoszenia
normalize_key(): uprość firmę + tytuł, zachowaj specjalizację roli
if ATS_job_id lub canonical_url istnieje: AKTUALIZUJ stary rekord
else if firma/rola i opis wskazują tę samą rekrutację: VERIFY_DUPLICATE
else: utwórz nowy JOB-#### w Offer Memory
verify readback()
if already_APPLIED / already_REPORTED / CLOSED: BRAK NOWEGO ALERTU
if active AND eligible AND match >= threshold: ALERT
else: ZACHOWAJ ŚLAD W MEMORY, BEZ ALERTU
```

**Dozwolone ponowne powiadomienie:** faktycznie nowy job ID, nowe otwarcie, istotna zmiana warunków, zaproszenie do rozmowy lub zmiana etapu — **jako aktualizacja istniejącego wpisu**, nie „niezauważona nowa oferta”. Alternatywny URL zapisuj w kolumnie F. Nie stosuj samego embedding similarity jako jedynego klucza.

## 12. Zarządzanie zmianą, bezpieczeństwo i jakość danych

- Zasada najmniejszych uprawnień: kandydat kontroluje, z kim współdzieli CV, telefon, email, historię rekrutacji i dane referencyjne.
- Nowemu użytkownikowi udostępniaj **wyłącznie pusty szablon**, nigdy Tracker ani Master CV innej osoby.
- Dane osobowe w promptach ogranicz do potrzebnego minimum; nie kopiuj dokumentów NDA, informacji klientów czy tajemnic firmowych do narzędzi, które nie są do tego dopuszczone.
- Wersjonuj dokument źródłowy i pliki aplikacyjne. Na zmianę faktów w Career KB wymagaj potwierdzenia właściciela.
- W arkuszu dodawaj statusy deterministycznie. Przy błędach zapisu pokaż, co zostało zrobione, a co nie; **nie twierdź, że plik zapisano, jeśli nie ma potwierdzenia**.
- Raz w tygodniu audyt: duplikaty, fałszywie „aktywne” oferty, nietrafione alerty, CV ponad 2 strony, brak URL, niespójność statusów, niezweryfikowane twierdzenia.

## 13. KPI i rytm operacyjny

**Codziennie (5–10 min):** nowe zweryfikowane oferty; wymagane decyzje; follow-upy na dziś; brakujące odpowiedzi.

**Raz w tygodniu (20–30 min):** liczba realnie nowych kwalifikujących się ofert, zatwierdzone aplikacje, odpowiedzi, rozmowy, conversion to interview, jakość ofert, źródła trafień, czas tworzenia CV, błędy dedup i zaległości.

**Raz w tygodniu (ok. 60 min) — nowość w 1.1:** jedna próbna rozmowa, wpis w `Mock_Interview_Log.md`.

**Co 4–6 tygodni — nowość w 1.1:** powtórka przeglądu rynku (5.1) dla aktywnych rodzin ról; aktualizacja statusów ✅/⚠️/❌ i Master CV.

**Praktyczne metryki:** `Response Rate = odpowiedzi / wysłane aplikacje`, `Interview Rate = zaproszenia / wysłane aplikacje`, `Duplicate Alert Rate = błędne ponowne alerty / wszystkie alerty`, `CV QA Pass Rate = CV spełniające checklistę / wygenerowane CV`, `Mock cadence = tygodnie z próbną rozmową / tygodnie poszukiwań`. Małe próby traktuj orientacyjnie, nie wyciągaj twardych wniosków z kilku zgłoszeń.

**Przegląd decyzji:** każda nieudana rekrutacja może dostarczyć konkretnej korekty profilu, ofert lub odpowiedzi. Nie „dokręcaj” CV do wymagań, których kandydat nie spełnia.

## 14. Kryteria odbioru wdrożenia

- [ ] Utworzony jeden folder główny, dziewięć katalogów 00–08 i pliki minimum.
- [ ] Właściwe dane kandydata, bez cudzego imienia, telefonu, maila i linków.
- [ ] Przegląd rynku zrobiony dla każdej rodziny ról; wymagania z ≥5/10 ogłoszeń mają status i następny krok.
- [ ] Master CV odseparowane od CV generowanych pod oferty.
- [ ] Tracker ma trzy zakładki o uzgodnionych nagłówkach i realne linki.
- [ ] Asystent potrafi odczytać oba rejestry przed nowym wyszukiwaniem.
- [ ] Powtórne uruchomienie tej samej oferty nie tworzy dodatkowego rekordu ani alertu.
- [ ] Zielona oferta generuje CV w osobnym Google Doc, link jest w Trackerze.
- [ ] Obejrzany PDF potwierdza maks. 2 strony, pogrubienia do ostatniego znaku, linki i układ.
- [ ] Wysłanie aplikacji jest statusowane wyłącznie na podstawie potwierdzenia.
- [ ] Brak połączenia Google nie prowadzi do fikcyjnego zapisu lub fikcyjnej deduplikacji.
- [ ] Próbna rozmowa co tydzień i przegląd tygodnia stoją w kalendarzu.
- [ ] Kandydat może łatwo wyeksportować dane i zamknąć projekt.

## 15. Kto za co odpowiada? (praktyczny RACI)

**Kandydat:** zatwierdza profil, osiągnięcia, statusy wymagań w przeglądzie rynku, role docelowe, ofertę i finalne CV; autoryzuje wysłanie; udziela feedbacku z rozmów. **Asystent AI:** wyszukuje, analizuje, porównuje, opracowuje CV i komunikację, prowadzi rejestry po potwierdzonych operacjach, prowadzi próbne rozmowy, sygnalizuje ryzyka. **Drive/Sheets:** utrzymuje trwały zapis. **Źródłowy ATS:** potwierdza aktywność, warunki i rzeczywistą aplikację. **Automatyzacja:** wykonuje powtarzalny odczyt i raport, ale nie przejmuje odpowiedzialności za decyzję kandydata.

## 16. Praktyczne prompty — quick reference

### 16.1 Analiza oferty

> Przeanalizuj tę ofertę względem mojego Master CV, Career Knowledge Base, Market Requirements i profilu. Najpierw zweryfikuj aktywny formularz oraz sprawdź `Offer Memory` i `Job Tracker`. Podaj: werdykt zielony/żółty/czerwony, match %, 3 dopasowania, 3 ryzyka, pozycjonowanie, 3–5 konkretnych zmian w CV, argumenty na rozmowę, krótki outreach i następny krok. Fakty niepotwierdzone zaznacz, nie wymyślaj doświadczeń. Zapisz analizę w trackerze, jeśli masz uprawnienia, i potwierdź wykonanie. Oferta: [LINK/TREŚĆ]

### 16.2 Dedykowane CV

> Przygotuj osobny Google Doc CV pod ofertę [LINK], na podstawie Master CV i tylko potwierdzonych faktów (statusy ✅ z Market Requirements). Nie zmieniaj Master CV. ATS-friendly, jedna kolumna, maks. 2 strony, Aptos 10.5, nagłówki sekcji i ról pogrubione w całości, cały blok nagłówka wyśrodkowany, aktywne LinkedIn/portfolio/GitHub, właściwa klauzula prawna. Style nałóż po ostatniej zmianie tekstu. Wyeksportuj PDF po ostatniej edycji, obejrzyj obie strony, popraw i dopiero wtedy zapisz link w Job Tracker. Nie oznaczaj aplikacji jako wysłanej.

### 16.3 Skan nowych ofert

> Znajdź nowe aktywne oferty zgodne z moimi rolami i ograniczeniami. Przed wyszukiwaniem odczytaj obie zakładki `Job Tracker` i `Offer Memory`. Zacznij od ogłoszeń z ostatnich 24–72 godzin i źródeł z Search_Policy. Zablokuj exact, likely i semantic duplicates. Dla nowych ofert sprawdź oryginalny formularz, lokalizację, stawkę, godziny i legalną dostępność, po czym zapisz Offer Memory przed raportem. Jeśli odczyt/zapis się nie uda, nie deklaruj, że oferta jest nowa; zgłoś błąd.

### 16.4 Follow-up

> Sprawdź aplikacje wysłane 5–7 dni temu bez odpowiedzi. Nie myl CV przygotowanego z wysłaną aplikacją. Przygotuj naturalny follow-up na max 4 zdania, uwzględnij jedną konkretną rzecz z ogłoszenia. Nie wysyłaj bez mojego zatwierdzenia.

### 16.5 Mock interview

> Poprowadź próbną rozmowę rekrutacyjną na rolę [ROLA] w [FIRMA] na bazie oferty, notatki o procesie rekrutacji tej firmy i moich prawdziwych projektów. Zadawaj tylko jedno pytanie. Po każdej odpowiedzi daj: ✅ Co działało, ⚠️ Co było słabe, 💡 Lepsza wersja do użycia. Zwracaj uwagę na STAR i zwięzłość; niczego nie dopowiadaj bez danych. Na koniec zapisz wpis w Mock_Interview_Log: najsłabsza odpowiedź i jedna rzecz do poprawy.

### 16.6 Przegląd tygodnia

> Odczytaj aktualny Job Tracker, podsumuj pipeline, aplikacje wymagające follow-upu, rozmowy, ryzyka i braki dokumentów. Sprawdź, czy w tym tygodniu była próbna rozmowa. Wskaż trzy najważniejsze działania na kolejny tydzień. Nie modyfikuj statusów na podstawie przypuszczeń.

### 16.7 Przegląd rynku (nowość w 1.1)

> Zrób przegląd rynku dla rodziny ról [ROLA] w [LOKALIZACJA/TRYB]. Znajdź 10 aktywnych ogłoszeń z ostatnich 30 dni, z różnych firm (maks. 2 z jednej), ze źródeł z Search_Policy. Wypisz wymagania słowami z ogłoszeń i policz, w ilu z 10 padają. Dla każdego wymagania z ≥3/10 zaproponuj status na podstawie Career Knowledge Base: ✅ mam z dowodem (wskaż dowód), ⚠️ mam bez dowodu, ❌ brak — nie oznaczaj ✅ bez dowodu. Zapisz wynik w kopii Market_Requirements_TEMPLATE.md, dodaj widełki z ogłoszeń i 3 główne luki. Statusy zatwierdzę ja.

### 16.8 Proces rekrutacji w firmie (nowość w 1.1)

> Sprawdź, jak wygląda proces rekrutacji w [FIRMA] na rolę [ROLA] lub zbliżoną: etapy, format, typy zadań i pytań, czas trwania. Korzystaj ze strony kariery, treści ogłoszenia i relacji kandydatów wyłącznie z ostatnich 12 miesięcy; przy każdej informacji podaj źródło i datę. Oddziel fakty od pojedynczych relacji. Zapisz wynik w kopii Company_Process_TEMPLATE.md i zaproponuj 3 zadania treningowe tego typu.

## 17. Pochodzenie, zmiany i licencja

**Stan bazowy (zweryfikowany 19.11.2026):** prawdziwy, osobisty system szukania pracy prowadzony w 2026 r.: dokument z promptami i workflow, arkusz z zakładkami `Job Tracker`, `Offer Memory`, `Search Rules`, folder z katalogami `00–08`, `Career Knowledge Base` oraz procedura antyduplikatów. Metodologia CV, statusy, follow-up po 5–7 dniach i bramka dedup wynikają z tych materiałów.

**Rekomendacje wersji 1.0 dla wersji przenośnej:** `Candidate_Profile.yaml`, ustandaryzowany onboarding, propozycja wag scoringu, podział na search główny i side gigs, KPI, macierz odpowiedzialności, szablony i kontrola bezpieczeństwa transferu danych.

**Zmiany w wersji 1.1 (24.11.2026):** przegląd rynku przed CV (`Market_Requirements_TEMPLATE.md`, krok 2, prompt 16.7); kryterium „Działa, gdy…” przy każdym kroku onboardingu; próbna rozmowa co tydzień w rytmie (`Mock_Interview_Log.md`); sprawdzanie procesu rekrutacji firmy (`Company_Process_TEMPLATE.md`, prompt 16.8); lista źródeł i taktyk wyszukiwania w `Search_Policy.md`; lekcje z formatowania CV w Google Docs i wariant CV bez kontaktu dla platform freelance; instrukcje projektu działają w ChatGPT i Claude (`Project_Instructions.md`). Część pomysłów (zacznij od ofert, nie od CV; ćwicz pod konkretną firmę; próbna rozmowa co tydzień; świeżość ogłoszeń) zainspirowała publiczna checklista szukania pracy matkowski.ai (stan na 14.10.2026); treść napisano od nowa.

**Licencja / użytkowanie:** MIT. Dokument to instrukcja do samodzielnego wykorzystania. Przy wdrożeniu podstaw wyłącznie **własne dane i własne linki**. Nie kopiuj historii rekrutacji, danych kontaktowych, CV ani informacji z innych kont.

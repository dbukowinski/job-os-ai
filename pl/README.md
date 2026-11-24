# JOB OS — start (wersja 1.1)

Osobisty system szukania pracy z asystentem AI (ChatGPT albo Claude) i Google Drive. Ten plik prowadzi Cię przez wdrożenie w 8 krokach. Każdy krok kończy się warunkiem **„Działa, gdy…”** — przejdź dalej dopiero, gdy jest spełniony.

Playbook (`00_Workflow_and_Prompts/JOB_OS_Playbook.md`) to dokumentacja na później: wyjaśnia, dlaczego system działa tak, a nie inaczej.

> **Stan danych:** puste szablony. Paczka nie zawiera cudzych CV, ofert ani danych aplikacyjnych.

## Czego potrzebujesz

- Konta Google (Drive, Docs, Sheets).
- ChatGPT albo Claude z funkcją projektów i podłączonym Google Drive. Bez połączenia też zadziała, ale zapisy w arkuszu robisz ręcznie.
- Aktualnego CV (dowolny format) i linków: LinkedIn, portfolio lub GitHub, jeśli masz.
- 2–4 rodzin ról, których szukasz, np. „Senior Business Analyst”, „Product Owner”.
- Około 5–7 godzin na wdrożenie, rozłożonych na kilka dni.

## Wdrożenie w 8 krokach

### 1. Profil i cele · 30–60 min
Uzupełnij `00_Workflow_and_Prompts/Candidate_Profile_TEMPLATE.yaml`: role docelowe, lokalizacja, model zatrudnienia, widełki, godziny, wykluczenia. Nie wpisuj danych, których nie potrzebujesz.

**Działa, gdy** profil ma role docelowe, warunki (model, stawka, godziny, lokalizacja) i listę wykluczeń.

### 2. Przegląd rynku przed CV · 60–90 min na rodzinę ról
Zanim ruszysz CV, przejrzyj 10 aktywnych ogłoszeń na każdą rodzinę ról. Wypisz wymagania, które się powtarzają, i oznacz każde: ✅ mam z dowodem, ⚠️ mam bez dowodu, ❌ brak. Użyj kopii `00_Workflow_and_Prompts/Market_Requirements_TEMPLATE.md`. Asystent może zebrać ogłoszenia za Ciebie (prompt niżej), ale statusy zatwierdzasz Ty.

**Działa, gdy** każde wymaganie, które pada w co najmniej 5 z 10 ogłoszeń, ma status i następny krok.

### 3. Baza faktów · 1–2 h
Wrzuć swoje CV do `01_Master_CV/` — to Master CV, którego nie zmieniasz przy pojedynczych aplikacjach. Uzupełnij `00_Workflow_and_Prompts/Career_Knowledge_Base.md`: projekty, dowody, historie STAR. Dla wymagań ⚠️ z kroku 2 poszukaj dowodu.

**Działa, gdy** Master CV leży w `01_Master_CV/`, a każde wymaganie ✅ ma w Career Knowledge Base wskazany dowód.

### 4. Drive i tracker · 20–30 min
Skopiuj cały folder paczki na swój Google Drive. Zaimportuj `02_Application_Tracker/JOB_Application_Tracker_TEMPLATE.xlsx` do Google Sheets jako nowy arkusz (Plik → Importuj albo otwórz plik i zapisz jako Arkusze Google).

**Działa, gdy** w Google Sheets są trzy zakładki o dokładnych nazwach `Job Tracker`, `Offer Memory`, `Search Rules`.

### 5. Projekt AI · 15 min
Utwórz projekt `Job — [Twoje imię]` w ChatGPT albo w Claude. Wklej treść `00_Workflow_and_Prompts/Project_Instructions.md` do instrukcji projektu. Podmień `[URL_...]` na linki do **własnych** dokumentów. Podłącz Google Drive.

**Działa, gdy** asystent zapytany „ile wierszy ma Offer Memory?” odczytuje arkusz i podaje liczbę (na starcie 0), zamiast zgadywać.

### 6. Test kontrolny · 20 min
Wklej jedną aktywną ofertę i napisz: „Przeanalizuj ofertę, dodaj do trackera i jeśli warto, stwórz CV pod ofertę”. Potem wklej tę samą ofertę drugi raz.

**Działa, gdy** druga próba nie tworzy nowego wiersza ani alertu, a CV przechodzi `00_Workflow_and_Prompts/CV_QA_Checklist.md`.

### 7. Rytm tygodnia · 10 min
Wpisz do kalendarza jako powtarzalne wydarzenia: codzienny przegląd (5–10 min), przegląd tygodnia (20–30 min) i **jedną próbną rozmowę w tygodniu** (ok. 60 min) aż do prawdziwej rozmowy. Wyniki próbnych rozmów zapisuj w `07_Interview_Prep/Mock_Interview_Log.md`.

**Działa, gdy** trzy terminy stoją w kalendarzu.

### 8. Monitoring · opcjonalnie
Automatyczne wyszukiwanie włącz dopiero po udanym kroku 6. Asystent przed każdym raportem musi przeczytać `Job Tracker` i `Offer Memory`.

**Działa, gdy** pierwszy automatyczny przebieg nie zgłasza jako nowej żadnej oferty, która już jest w `Offer Memory`.

## Codzienna praca — krótkie komendy

| Chcesz | Napisz do asystenta |
|---|---|
| Ocenić ofertę | „Przeanalizuj ofertę, dodaj do trackera i jeśli warto, stwórz CV pod ofertę: [link]” |
| Przegląd rynku | „Zrób przegląd rynku dla roli [rola] według promptu 16.7 z playbooka” |
| Nowe oferty | „Znajdź nowe aktywne oferty według promptu 16.3” |
| Przygotować się do rozmowy | „Sprawdź proces rekrutacji w [firma] (prompt 16.8), potem poprowadź próbną rozmowę (16.5)” |
| Follow-up | „Sprawdź aplikacje bez odpowiedzi od 5–7 dni i przygotuj follow-upy” |
| Podsumowanie tygodnia | „Zrób przegląd tygodnia (16.6)” |

Pełne prompty są w rozdziale 16 playbooka.

## Zasady, których system pilnuje

- AI przygotowuje, Ty decydujesz i Ty wysyłasz. Status `Wysłane` tylko po potwierdzeniu.
- Żadnych wymyślonych faktów, liczb, narzędzi ani doświadczeń. Wymaganie ❌ nie trafia do CV jako umiejętność.
- Żadna oferta nie jest „nowa”, dopóki asystent nie sprawdzi obu rejestrów.
- Master CV jest nietykalne; każde CV pod ofertę to osobny dokument.
- PDF oglądasz przed wysłaniem — liczy się to, co widzi rekruter.

## Odpowiedzialność i prywatność

- JOB OS to szablony i instrukcje, nie doradztwo kariery ani porada prawna. AI może się pomylić — za treść wysłanej aplikacji odpowiadasz Ty.
- Paczka niczego nie zbiera. CV i dane z profilu przetwarza asystent AI, którego używasz — sprawdź ustawienia prywatności konta (m.in. trenowanie modeli na rozmowach).
- Nie wklejaj numeru PESEL ani dowodu, danych innych osób bez ich zgody ani dokumentów objętych NDA.
- Z portali z ofertami korzystasz zgodnie z ich regulaminami: bez masowego aplikowania i automatycznego pobierania danych, jeśli regulamin tego zabrania.

## Co jest w paczce

```text
README.md                         ← jesteś tutaj
00_Workflow_and_Prompts/          playbook, instrukcje projektu, profil, baza faktów,
                                  przegląd rynku, źródła, checklista CV, antyduplikaty
01_Master_CV/                     Twoje bazowe CV (tylko odczyt)
02_Application_Tracker/           szablon arkusza: Job Tracker, Offer Memory, Search Rules
03_Job_Offers_Raw/                treści ofert, źródło, data
04_Custom_CV_Google_Docs/         CV pod konkretne oferty
05_Custom_CV_PDF_DOCX/            wersje do wysłania
06_Recruiter_Messages/            szablony wiadomości i follow-upów
07_Interview_Prep/                historie STAR, proces rekrutacji firmy, dziennik próbnych rozmów
08_Archive/                       stare wersje i zamknięte sprawy
```

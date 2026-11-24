# JOB OS 🧭

🇵🇱 Polski · 🇬🇧 [English version](README.en.md)

**Osobisty system szukania pracy z asystentem AI** (ChatGPT albo Claude) i Google Drive.

Zamiast wysyłać to samo CV w dziesięć miejsc: najpierw sprawdzasz, czego naprawdę wymaga rynek, budujesz bazę faktów, a potem każda oferta przechodzi ten sam proces — weryfikacja, brak duplikatów, ocena, CV pod ofertę, aplikacja, follow-up, rozmowa, wnioski. AI przygotowuje, Ty decydujesz.

> Stan: **wersja 1.1** (24.11.2026), po polsku i [po angielsku](README.en.md). Same puste szablony — żadnych cudzych danych.

## Co dostajesz

- **Przegląd rynku przed CV:** 10 ogłoszeń na rodzinę ról → wymagania, które się powtarzają → przy każdym ✅ mam z dowodem / ⚠️ mam bez dowodu / ❌ brak. CV powstaje na tym, czego szukają firmy, i tylko z tego, co umiesz udowodnić.
- **Tracker w Google Sheets z pamięcią ofert:** `Job Tracker` (status aplikacji), `Offer Memory` (każda zobaczona oferta, także odrzucona), `Search Rules`. Asystent nie zgłosi drugi raz tej samej oferty.
- **CV pod ofertę z bramką jakości:** Master CV zostaje nietknięte, każde CV to osobny Google Doc, sprawdzony w PDF przed wysłaniem. Z lekcjami z praktyki (pułapki Google Docs, wariant bez kontaktu dla platform freelance).
- **Przygotowanie do rozmów:** jak rekrutuje konkretna firma (źródła z ostatnich 12 miesięcy), historie STAR, jedna próbna rozmowa w tygodniu z dziennikiem postępów.
- **Rytm i KPI:** 5–10 minut dziennie, przegląd tygodnia, powtórka przeglądu rynku co 4–6 tygodni.
- **Gotowe instrukcje projektu AI** i prompty do każdego etapu.

## Jak to działa

```
Profil ──► Przegląd rynku ──► Baza faktów + Master CV ──► Projekt AI + tracker
                                                               │
     ┌─────────────────────────────────────────────────────────┘
     ▼
Oferta ──► aktywna? ──► duplikat? ──► ocena 🟢🟡🔴 ──► CV pod ofertę ──► PDF QA ──► Ty wysyłasz
                                                                                      │
                     wnioski ◄── rozmowa ◄── próbne rozmowy co tydzień ◄── follow-up ◄┘
```

## Start

1. Pobierz paczkę: [`dist/JOB_OS_Pakiet_Startowy_v1.1.zip`](dist/JOB_OS_Pakiet_Startowy_v1.1.zip) albo skopiuj folder [`pl/`](pl/).
2. Wrzuć folder na swój Google Drive.
3. Otwórz [`pl/README.md`](pl/README.md) i przejdź 8 kroków. Każdy kończy się warunkiem „Działa, gdy…”.

Wdrożenie zajmuje ok. 5–7 godzin, rozłożonych na kilka dni. Potrzebujesz konta Google i ChatGPT albo Claude z projektami.

## Zasady

- AI przygotowuje, Ty decydujesz i Ty wysyłasz.
- Żadnych wymyślonych faktów, liczb ani doświadczeń.
- Żadna oferta nie jest „nowa”, dopóki asystent nie sprawdzi obu rejestrów.
- „Zapisano” tylko po potwierdzonym zapisie.
- Twoje dane zostają na Twoim Dysku. Nikomu nie udostępniaj swojego trackera ani Master CV — przekazuj tylko puste szablony.

## Struktura repo

```text
README.md, README.en.md    opis (PL / EN)
pl/                        paczka po polsku — kopiujesz na Dysk
en/                        English package
dist/                      gotowe ZIP-y obu wersji
scripts/build-zip.sh       buduje ZIP-y z folderów pl/ i en/
CHANGELOG.md, LICENSE
```

Szczegóły metody: [`pl/00_Workflow_and_Prompts/JOB_OS_Playbook.md`](pl/00_Workflow_and_Prompts/JOB_OS_Playbook.md).

## Licencja

MIT — zobacz [LICENSE](LICENSE). Część pomysłów wersji 1.1 zainspirowała publiczna checklista szukania pracy matkowski.ai; szczegóły w rozdziale 17 playbooka.

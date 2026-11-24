# JOB OS — Pamięć ofert i deduplikacja (uniwersalna)

## Wymagany preflight
- Odczytaj aktualne `Job Tracker` i `Offer Memory` (nie pamięć czatu).
- Zachowaj numery wierszy, statusy i URL-e.
- Jeśli którykolwiek odczyt się nie uda, wstrzymaj każdy alert „nowa oferta”.

## Tożsamość / normalizacja
- Usuń UTM/fbclid/gclid/trk i fragment URL, zachowaj ATS job ID / UUID.
- Zbuduj kanoniczny klucz firma + konkretna rola; nie wycinaj istotnej specjalizacji.
- Dokładny: zgodny ATS ID / URL kanoniczny → ten sam rekord.
- Prawdopodobny: pracodawca, tytuł, projekt, seniority, wymagania, wymiar godzin → sprawdź ręcznie.
- Semantyczny: inny portal/agencja, podobny pracodawca/projekt/opis → zbadaj, bez alertu do rozstrzygnięcia.
- Różne role u tego samego pracodawcy mogą być osobnymi rekordami; nie łącz na ślepo.

## Odpowiedzialność rejestrów
- `Offer Memory`: WSZYSTKIE oferty — zobaczone, aplikowane, odrzucone, zamknięte, przygotowane, talent pool. Stały JOB-#### i data pierwszej obserwacji.
- `Job Tracker`: oferty naprawdę ocenione/aplikowane i status aplikacji. `Wysłane` tylko z dowodem.
- Nie zmieniaj statusu aplikacji na podstawie prawdopodobnych przypuszczeń.

## Bramka publikacji
- Oryginalna ścieżka aplikacji potwierdzona jako aktywna.
- Dostępność z kraju użytkownika / remote i godziny sprawdzone albo wprost oznaczone jako nieznane.
- Dopasowanie kompetencyjne + operacyjne spełnia próg toru (domyślnie side gigs 80%).
- Kontrola duplikatów przeszła na OBU zakładkach.
- Nowy wiersz Memory zapisany i odczytany kontrolnie przed alertem.
- Jeśli którykolwiek warunek nie jest spełniony — żadnego alertu „na pewno nowa oferta”.

## QA
Cotygodniowy audyt: zgłoszone duplikaty, pominięte pasujące ogłoszenia, zamknięte oferty, nieudane weryfikacje i fałszywe założenia.

# Changelog

Alle relevanten Änderungen an Schulportal werden in dieser Datei dokumentiert.

Das Format orientiert sich an [Keep a Changelog](https://keepachangelog.com/de/1.1.0/),
die Versionierung folgt [Semantic Versioning](https://semver.org/lang/de/).

## [1.1.0] — 2026-05-30

### Sicherheit
- **Security-Header** — nginx liefert jetzt `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff`, `Referrer-Policy: no-referrer`, `Content-Security-Policy` und `Permissions-Policy` mit aus.
- **server_tokens off** — nginx-Versionsnummer wird nicht mehr in HTTP-Antwort-Headern ausgegeben.
- **nginx-Image gepinnt** — Basis-Image auf `nginx:1.27-alpine` fixiert statt des Floating-Tags `nginx:alpine`.

### Behoben
- **Dark-Mode-Fallback** — beim ersten Besuch (kein gespeicherter Wert in localStorage) wird jetzt die Betriebssystem-Präferenz (`prefers-color-scheme`) ausgewertet statt pauschal Dark Mode anzunehmen.
- **Toggle-Button-Icon** — Icon zeigt nun korrekt ☀️ im Dark Mode und 🌙 im Light Mode; vorher war es immer ☀️.

## [1.0.0] — 2026-05-08

### Hinzugefügt
- Landing Page mit Links zu Kurswahl und Nachschreiber.
- URLs werden dynamisch aus `window.location.hostname` abgeleitet: Subdomain-Schema (`schulportal.*` → `kurswahl.*` / `nachschreiber.*`) mit Port-Fallback für lokale Nutzung.
- Dark Mode mit localStorage-Persistenz.
- Docker-Deployment via nginx:alpine.

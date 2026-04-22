# Schulportal

Minimale Landing Page für schulinterne Web-Tools. Stellt eine Einstiegsseite bereit, die zu allen verfügbaren Anwendungen verlinkt.

Die URLs der verlinkten Apps werden beim Containerstart über Umgebungsvariablen gesetzt — kein Rebuild nötig, wenn sich die Adressen ändern.

## Enthaltene Tools

| Tool | Beschreibung |
|------|--------------|
| [Kurswahl](https://github.com/ThomasStolt/Kurswahl) | Automatische Kurszuweisung per Optimierungsalgorithmus |
| [Nachschreiber](https://github.com/ThomasStolt/Nachschreiber) | Sitzplanerstellung für Nachschreibtermine |

---

## Schnellstart — Lokale Nutzung

Für den Betrieb im lokalen Netz (z.B. Heimserver, Raspberry Pi ohne externe Domain).

### Voraussetzungen

- Docker & Docker Compose
- Kurswahl läuft auf Port 3001
- Nachschreiber läuft auf Port 3002

### Starten

```bash
git clone https://github.com/ThomasStolt/Schulportal.git
cd Schulportal
docker compose up -d --build
```

Die Landing Page ist unter **http://localhost** (Port 80) erreichbar.  
Die Links verweisen standardmäßig auf `http://localhost:3001` und `http://localhost:3002`.

---

## Externe Nutzung mit eigener Domain (z.B. CloudFlare Tunnel)

Für den Betrieb mit öffentlich erreichbaren URLs, z.B. via CloudFlare Tunnel.

### 1. CloudFlare Tunnel einrichten

Im CloudFlare Zero Trust Dashboard drei Public Hostnames anlegen:

| Hostname | Service |
|----------|---------|
| `schulportal.example.org` | `http://localhost:80` |
| `kurswahl.example.org` | `http://localhost:3001` |
| `nachschreiber.example.org` | `http://localhost:3002` |

### 2. URLs in `docker-compose.yml` anpassen

```yaml
environment:
  - KURSWAHL_URL=https://kurswahl.example.org
  - NACHSCHREIBER_URL=https://nachschreiber.example.org
```

### 3. Container neu starten

```bash
docker compose up -d --build
```

---

## Konfiguration

Die Links werden beim Containerstart per `envsubst` in die HTML-Seite eingesetzt. Änderungen an den Umgebungsvariablen werden erst nach einem Neustart des Containers wirksam:

```bash
docker compose up -d
```

(Kein `--build` nötig, da sich nur die Konfiguration, nicht der Code ändert.)

| Variable | Standard | Beschreibung |
|----------|----------|--------------|
| `KURSWAHL_URL` | `http://localhost:3001` | URL der Kurswahl-App |
| `NACHSCHREIBER_URL` | `http://localhost:3002` | URL der Nachschreiber-App |

---

## Neues Tool hinzufügen

1. Neue Karte in `index.html` ergänzen:

```html
<a class="card" href="${NEUES_TOOL_URL}">
  <div class="card-icon">🔧</div>
  <div class="card-title">Tool-Name</div>
  <div class="card-desc">Kurze Beschreibung.</div>
</a>
```

2. Neue Umgebungsvariable in `docker-compose.yml` hinzufügen:

```yaml
environment:
  - NEUES_TOOL_URL=http://localhost:3003
```

3. Committen, pushen und auf dem Server neu bauen:

```bash
git add .
git commit -m "feat: add neues-tool"
git push
docker compose up -d --build
```

---

## Design

Gleiche Designsprache wie Kurswahl und Nachschreiber — DM Sans, Bricolage Grotesque, Amber-Akzent, Dark Mode.

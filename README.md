# Schulportal

Minimale Landing Page für schulinterne Web-Tools. Stellt eine Einstiegsseite bereit, die zu allen verfügbaren Anwendungen verlinkt.

## Enthaltene Tools

| Tool | Port | Beschreibung |
|------|------|--------------|
| [Kurswahl](https://github.com/ThomasStolt/Kurswahl) | 3001 | Automatische Kurszuweisung per Optimierungsalgorithmus |
| [Nachschreiber](https://github.com/ThomasStolt/Nachschreiber) | 3002 | Sitzplanerstellung für Nachschreibtermine |

## Schnellstart

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

Die Landing Page ist anschließend unter **http://localhost** (Port 80) erreichbar.

## Deployment auf dem Raspberry Pi

```bash
git clone https://github.com/ThomasStolt/Schulportal.git
cd Schulportal
docker compose up -d --build
# Erreichbar auf http://192.168.2.54
```

Port 80 muss frei sein – Kurswahl ggf. vorher von Port 80 auf 3001 umstellen:

```bash
# In Kurswahl/docker-compose.yml: "80:80" → "3001:80"
cd Kurswahl && docker compose up -d
```

## Neues Tool hinzufügen

1. Neue Karte in `index.html` ergänzen:

```html
<a class="card" href="http://192.168.2.54:PORT">
  <div class="card-icon">🔧</div>
  <div class="card-title">Tool-Name</div>
  <div class="card-desc">Kurze Beschreibung.</div>
</a>
```

2. Committen und auf dem Pi neu bauen:

```bash
git add index.html
git commit -m "feat: add Tool-Name"
git push
# Auf dem Pi:
git pull && docker compose up -d --build
```

## Design

Gleiche Designsprache wie Kurswahl und Nachschreiber — DM Sans, Bricolage Grotesque, Amber-Akzent, Dark Mode.

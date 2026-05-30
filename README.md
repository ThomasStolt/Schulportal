# Schulportal

Minimale Landing Page für schulinterne Web-Tools. Stellt eine Einstiegsseite bereit, die zu allen verfügbaren Anwendungen verlinkt.

Die URLs der verlinkten Apps werden **automatisch** aus der aktuellen Domain abgeleitet — kein Build-Schritt, keine Konfiguration, keine Umgebungsvariablen nötig.

## Enthaltene Tools

| Tool | Port | Beschreibung |
|------|------|--------------|
| [Kurswahl](https://github.com/ThomasStolt/Kurswahl) | 3001 | Automatische Kurszuweisung per Optimierungsalgorithmus |
| [Nachschreiber](https://github.com/ThomasStolt/Nachschreiber) | 3002 | Sitzplanerstellung für Nachschreibtermine |

---

## Schnellstart

```bash
git clone https://github.com/ThomasStolt/Schulportal.git
cd Schulportal
docker compose up -d --build
```

Die Landing Page ist unter **http://\<host\>** (Port 80) erreichbar.  
Die Links verweisen automatisch auf `http://<host>:3001` und `http://<host>:3002` — egal ob lokal, im Heimnetz oder über eine externe Domain.

---

## Wie es funktioniert

Die Ziel-URLs werden im Browser per JavaScript aus `window.location.hostname` abgeleitet:

```js
const base = window.location.protocol + '//' + window.location.hostname;
// Kurswahl:     base + ':3001'
// Nachschreiber: base + ':3002'
```

Dadurch funktioniert das Portal auf jeder Domain ohne Anpassung.

---

## Neues Tool hinzufügen

1. Neue Karte in `index.html` ergänzen und Link per JavaScript setzen:

```html
<a class="card" id="link-neues-tool" href="#">
  <div class="card-icon">🔧</div>
  <div class="card-title">Tool-Name</div>
  <div class="card-desc">Kurze Beschreibung.</div>
</a>
```

```js
document.getElementById('link-neues-tool').href = base + ':3003';
```

2. Committen, pushen und auf dem Server neu bauen:

```bash
git add .
git commit -m "feat: add neues-tool"
git push
docker compose up -d --build
```

---

## Design

Gleiche Designsprache wie Kurswahl und Nachschreiber — DM Sans, Bricolage Grotesque, Amber-Akzent, Dark Mode.

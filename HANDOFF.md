# HANDOFF: Mononium website project

**Datum:** 14-jun-2026 (nacht)
**Aan:** nieuwe Hermy-sessie
**Context:** Mononium = B2B AI photobooth SaaS voor event agencies (NL/BE). Onderdeel van Mono by Dusty. Eén dag intensieve design-iteraties via Telegram.

## Wat is af

### Bestanden
In `~/.gstack/projects/_default/designs/mononium-1pager-20260614/`:

| Bestand | Grootte | Inhoud |
|---|---|---|
| `finalized.html` | 38.6 KB | 1-pager (hero, showcase, /01 wat, /02 hoe, /03 ROI, /04 pricing, /05 CTA) |
| `privacy.html` | 17.1 KB | AVG-conform privacy statement, 7 secties |
| `terms.html` | 21.5 KB | Algemene voorwaarden B2B SaaS, 9 secties |
| `archive/v1-purple-template.html` | 21.8 KB | Eerste AI-template versie (paars, emoji) |
| `archive/v2-oranje-darkmode.html` | 24.3 KB | Tweede versie (oranje + dark mode fix) |
| `archive/v3-groen-mixed.html` | 35.8 KB | Derde versie (electric green + mixed showcase) |
| `archive/v4-portrait-final.html` | 38.6 KB | Definitieve versie (5 portrait showcase) |

### Design system (af)

- **Fonts:** Geist Sans (display) + Geist Mono (cijfers, labels, kickers) via Google Fonts
- **Light mode tokens:** bg `#FAFAF6` warm cream, ink `#0A0A0A`, ink-2 `#4A4A45`, ink-3 `#8B8B85`, accent `#00B86B` electric green, accent-dk `#008F54`
- **Dark mode tokens (prefers-color-scheme: dark):** bg `#0A0A0A`, ink `#FAFAF6`, ink-2 `#C8C8C2`, ink-3 `#9A9A92`, accent `#00D26A`, accent-dk `#00B86B`, line-soft `rgba(250,250,246,0.20)`
- **Borders:** 1px solid, scherpe radii (0-2px), generous whitespace
- **Layout:** 12-koloms grid, 200px label col, content max 820px voor detail pagina's
- **Animaties:** GSAP 3.12.5 via CDN, ScrollTrigger. Hero fade-in on load, count-up cijfers, section fade-up on scroll, hover micro's
- **prefers-reduced-motion respect**

### Anti-slop (verplicht, niet vergeten)

- Geen em-dashes (verboden, vervangen door komma/punt/`/` in mono context)
- Geen Inter, geen paars, geen emoji icons, geen stockphoto, geen glassmorphism
- Geen `Meest gekozen` style badges
- Geen decorative SVG illustrations

### Showcase placeholders (bewust)

In de 1-pager showcase (5 portrait items, 4/5 ratio, 1 rij op desktop):

- `.style-aurora` → warm gradient `#FFD8B5` → `#FF9985` → `#C77FFF`
- `.style-pencil` → grijs gradient `#FAF8F2` → `#E0D9C5` → `#B8B095`
- `.style-watercolor` → pastel `#FFE0D5` → `#D8E5F5` → `#E8D8F5`
- `.style-ink` → dark `#2C2C3A` → `#0F0F1F`
- `.style-coral` → `#FFB89A` → `#FF7050` → `#D63F8C`

**Dusty vervangt deze zelf met echte AI-foto's:** vervang de gradient `background-image` met `url(...)` per `.showcase-item` klasse.

### Pricing

- Starter: €229/m, max 5 events, max 500 foto's/event (mailto:hello@mononium.com voor demo)
- Growth: €449/m, max 15 events, custom branding, white-label QR
- Scale: €849/m, onbeperkt events, dedicated CSM, API

### Contact

- Demo CTA: `mailto:hello@mononium.com?subject=Plan%20demo`
- Contact mailto in privacy/terms: `hello@mononium.com`

## Wat nog moet gebeuren (open)

### 1. Git + Railway deploy

Te doen door Dusty op Mac mini, in `~/.gstack/projects/_default/designs/mononium-1pager-20260614/`:

```bash
# Init
cd ~/.gstack/projects/_default/designs/mononium-1pager-20260614
git init && git add . && git commit -m "v4.0 / 14-jun-2026"

# GitHub repo (interactief via gh, of handmatig op github.com)
gh repo create mononium-website --public --source=. --push

# Railway (eenmalig: railway login opent browser voor OAuth)
railway login
railway init --name mononium-website
railway up --detach

# URL ophalen
railway domain
```

Geen Dockerfile of build step nodig. Railway pakt statische HTML vanzelf. NIXPACKS detecteert automatisch.

### 2. Discord integratie via Hermes

Stappen voor Dusty:

1. Discord app openen, server aanmaken (prive, naam naar keuze)
2. Categorieën aanmaken in die server: `mononium`, `cosmo`, `taf`, `persoonlijk`, `vragen`
3. https://discord.com/developers/applications → "New Application" → naam "Hermy"
4. Bot tab → "Add Bot" → Token kopiëren (lange base64 string)
5. OAuth2 → URL Generator → scopes: `bot` → permissions: `Send Messages`, `Read Message History`, `View Channels`, `Manage Messages`, `Use Slash Commands` (optioneel)
6. Gegenereerde URL openen in browser, bot toevoegen aan nieuwe server
7. Bot token aan Hermy geven (via Telegram of `~/.hermes/config.yaml` direct)

Hermy kant: Discord connector toevoegen aan Hermes config, herstarten, bot komt online.

### 3. Showcase foto's (door Dusty)

In elke `.showcase-item` met class `style-aurora` etc., vervang:

```css
background-image: linear-gradient(135deg, ...);
```

met:

```css
background-image: url('images/showcase-aurora.jpg');
background-size: cover;
background-position: center;
```

## Belangrijke context

### Versie nummering

Bij elke significante wijziging: update v4 → v5 in:
- `<span>AI Photobooth / voor event agencies / v4.0</span>` (hero kicker)
- `<div class="footer-r">v4 / 14-jun-2026</div>` (footer rechts)

### Tunnel + Server

- Local server: `python3 -m http.server 8911` in project dir
- Cloudflare quick tunnel: geeft willekeurige trycloudflare.com URL, geen uptime garantie
- Echte URL komt via Railway deploy (stap 1)

### Open Brain gedachten

Belangrijke context in Open Brain:
- `Mononium` entity profile
- Sprint-2 overzicht (KLM, Red Bull, Van Gogh cases)
- 10 beslissingen + 7 lean-beslissingen wachten op Dusty ja/nee vóór ma 15 jun 9:00
- Hermes COSMO-OS-CURRENT-STATE: Cosmo is Hermy's manager sinds 8-jun

### Best practices SOUL.md

- Geen em-dashes (gehardcodeerd in geheugen)
- Geen geld overmaken zonder expliciete goedkeuring
- Cosmo is sinds 8-jun mijn operationele manager
- Bij twijfel: vraag Cosmo of Dusty
- Rapport compact: wat is gedaan, wat staat open, waar staat het

## Check of alles nog werkt

Na elke wijziging:

```bash
# Em-dash check (moet 0 zijn in alle HTML files)
grep -c "—" finalized.html privacy.html terms.html

# HTTP status
for f in finalized.html privacy.html terms.html; do
  curl -s -o /dev/null -w "$f: HTTP %{http_code}\n" http://127.0.0.1:8911/$f
done

# Console errors (in browser)
browser_navigate + browser_console op elke pagina
```

## Volgende iteraties (TODO)

- Showcase foto's vervangen door echte AI-outputs
- Demo flow: Calendly integratie of eigen scheduler
- Eventueel dashboard/login flow (als Mononium uitbreidt naar user accounts)
- Social proof sectie (testimonials van agencies)
- Analytics integratie (Plausible self-hosted)

## Handoff einde

Status: site is af op visuele + interactieve kwaliteit. Railway deploy + Discord setup wachten op Dusty's actie vanavond. Daarna productie op een echte URL.

— Hermy (overdracht aan nieuwe sessie)

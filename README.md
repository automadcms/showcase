# Automad Showcase

A static gallery site showcasing real websites built with the [Automad](https://automad.org) CMS.

The page is generated from a JSON data file and an HTML template — no JS framework or bundler involved.

## Submit your site

Built something with Automad? Open an issue with your site's URL in order to apply.

| [**Submit your site →**](https://github.com/automadcms/showcase/issues/new?title=Site+submission&body=Website+URL%3A+) |
| :--------------------------------------------------------------------------------------------------------------------: |

## Requirements

- [Node.js](https://nodejs.org) (for image optimization)
- [jq](https://jqlang.org) (for the build script)
- PHP (only needed for `npm run serve`)

## Setup

```
npm install
```

## Adding a site

1. Drop a screenshot into `temp/` as a `.png` file.
2. Run `npm run optimize` to resize (max 800×800) and convert it to an optimized `.webp` in `public/screenshots/`.
3. Add an entry to `sites.json`:
   ```json
   {
     "title": "Site Name",
     "url": "https://example.com",
     "screenshot": "example.com.webp"
   }
   ```
   The `screenshot` filename must match the `.webp` file generated in step 2.
4. Run `npm run build` to regenerate `public/index.html`.

## Scripts

| Command            | Description                                                                  |
| ------------------ | ---------------------------------------------------------------------------- |
| `npm run optimize` | Resizes and converts `temp/*.png` screenshots to `public/screenshots/*.webp` |
| `npm run build`    | Renders `sites.json` + `template.html` into `public/index.html`              |
| `npm run serve`    | Serves the `public/` directory locally at `http://localhost:8000`            |

## Project structure

- `sites.json` — the list of showcased sites (`title`, `url`, `screenshot`)
- `template.html` — the page shell, with a `__SITES__` placeholder for the gallery
- `build.sh` — renders the gallery markup and writes `public/index.html`
- `public/styles/styles.css` — all styles
- `public/screenshots/` — optimized screenshots referenced by `sites.json`
- `optimize-images.js` — resizes/converts raw screenshots from `temp/` into `public/screenshots/`

`public/index.html` is generated — edit `template.html` and `styles.css` instead, then re-run `npm run build`.

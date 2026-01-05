# Alfons Zelicko personal website

[DEMO](https://zelicko.dev)

- it works without JS (but email links will be not visible), dark/light mod or high/low contrast
  will not be persisted in local storage and discussions in Notes section will not work as well.
- it works in all browsers and all resolutions

[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)

Alfons Zelicko's personal website built with [Hugo](https://gohugo.io).

## Development

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (static site generator)
- [Node.js](https://nodejs.org/) and [pnpm](https://pnpm.io/) (for Prettier)
- [Prettier VS Code extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
  (for automatic formatting)

### Setup

```bash
# Install Prettier and plugins for proper Hugo template formatting
pnpm install

# Start development server
hugo server
```

The development environment will be accessible on `http://localhost:1313`.

## Production

As Hugo is a static website builder, you can just host the website on any hosting service. To build
the static files, run `pnpm build` or manually `hugo --minify --gc -b <domain>`.

The built files will be in the `public` folder, ready for deployment.

For more commands read `project.json` - Scripts section.

### License

- [MIT](https://opensource.org/license/MIT) for all website code

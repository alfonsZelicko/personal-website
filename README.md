# Alfons Zelicko personal website

[DEMO](https://alfonszelicko.github.io/personal-website/)

- it works without JS (but email links will be not visible), dark/light mod or high/low contrast
  will not be persisted in local storage
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
# or use make command
make dev
```

The development environment will be accessible on `http://localhost:1313`.

## Production

As Hugo is a static website builder, you can just host the website on any hosting service. To build
the static files, run `make build` or manually `hugo --minify --gc -b https://alfonszelicko.com`.

The built files will be in the `public` folder, ready for deployment.

When using `make build` it also runs the formatter before building.

## Make

The `make` command can also be used:

| Command       | Functionality                                          |
| ------------- | ------------------------------------------------------ |
| `make server` | Runs hugo server                                       |
| `make dev`    | Runs hugo server and opens `localhost:1313` in browser |
| `make build`  | Formats code and runs hugo build for production        |
| `make fmt`    | Runs Prettier formatting for all files                 |

### License

- [MIT](https://opensource.org/license/MIT) for all website code

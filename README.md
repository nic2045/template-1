# template-1

Opinionated template repository for projects that combine **Python** and **PowerShell**.

Use the green **Use this template** button on GitHub to bootstrap a new project from this repo.

## What you get

| Area | Tooling |
| --- | --- |
| Python lint + format | [`ruff`](https://docs.astral.sh/ruff/) |
| Python tests | [`pytest`](https://docs.pytest.org/) |
| PowerShell lint | [`PSScriptAnalyzer`](https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview) |
| PowerShell tests | [`Pester`](https://pester.dev/) |
| CI | GitHub Actions, path-filtered per language (Python 3.10–3.12, PowerShell on Ubuntu + Windows) |
| Releases | [`release-please`](https://github.com/googleapis/release-please) |
| PR hygiene | Conventional Commits enforced via PR title check |
| Dependencies | Dependabot (GitHub Actions + pip, weekly), auto-merge for patch & minor |
| Editor consistency | `.editorconfig` |

## Repository layout

```
.
├── src/template_1/        # Python package
├── tests/                 # pytest + Pester tests
├── powershell/            # PowerShell module (psm1 + psd1)
├── .github/
│   ├── workflows/         # ci-python.yml, ci-powershell.yml, release-please.yml, pr-title.yml, dependabot-automerge.yml
│   ├── ISSUE_TEMPLATE/
│   └── dependabot.yml
├── pyproject.toml
├── release-please-config.json
└── .release-please-manifest.json
```

## Getting started

### Python

```bash
pip install -e ".[dev]"
ruff check .
ruff format --check .
pytest
```

### PowerShell

```powershell
Install-Module -Name PSScriptAnalyzer, Pester -Scope CurrentUser -Force
Invoke-ScriptAnalyzer -Path . -Recurse
Invoke-Pester
```

## Commit & release workflow

All commits and PR titles must follow [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Meaning | Version bump |
| --- | --- | --- |
| `feat:` | new feature | minor |
| `fix:` | bug fix | patch |
| `feat!:` / `BREAKING CHANGE:` | breaking change | major |
| `chore:`, `docs:`, `refactor:`, `test:`, `ci:`, `build:`, `perf:` | maintenance | none |

When commits land on `main`, [`release-please`](https://github.com/googleapis/release-please) opens (or updates) a release PR. Merging that PR tags a new version and publishes a GitHub release. Versions are kept in sync across `pyproject.toml`, `powershell/Template.psd1`, and `src/template_1/__init__.py`.

## After cloning from this template

1. Rename the Python package (`src/template_1/` and references in `pyproject.toml`, tests).
2. Update `powershell/Template.psd1` (GUID, author, description).
3. Update `README.md` and `LICENSE` (copyright holder).
4. In **Settings → General**, enable *Template repository* if you want this repo to be reusable as well.

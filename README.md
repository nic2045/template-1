# template-1

Template-Repo für Projekte mit **Python** und **PowerShell**.

## Inhalt

- Python-Setup mit [`ruff`](https://docs.astral.sh/ruff/) (Lint + Format) und [`pytest`](https://docs.pytest.org/)
- PowerShell-Setup mit [`PSScriptAnalyzer`](https://learn.microsoft.com/de-de/powershell/utility-modules/psscriptanalyzer/overview) und [`Pester`](https://pester.dev/)
- GitHub Actions Workflows:
  - `ci.yml` – Lint und Tests für Python und PowerShell
  - `release-please.yml` – automatische Releases via [release-please](https://github.com/googleapis/release-please)
- Conventional Commits (`feat:`, `fix:`, `chore:` …) für automatisches Versioning

## Verwendung als Template

1. Auf GitHub: **Use this template** → neues Repo erstellen
2. Lokal klonen, anpassen, loslegen

## Python

```bash
pip install -e ".[dev]"
ruff check .
ruff format --check .
pytest
```

## PowerShell

```powershell
Install-Module -Name PSScriptAnalyzer, Pester -Scope CurrentUser -Force
Invoke-ScriptAnalyzer -Path . -Recurse
Invoke-Pester
```

## Releases

Releases werden durch [release-please](https://github.com/googleapis/release-please) gesteuert.
Commit-Messages müssen dem [Conventional Commits](https://www.conventionalcommits.org/) Format folgen, z.B.:

- `feat: neue Funktion X`
- `fix: behebt Y`
- `feat!: breaking change`

Beim Merge in `main` wird automatisch ein Release-PR erstellt bzw. aktualisiert. Sobald dieser gemerged wird, entsteht ein neuer Tag und ein GitHub Release.

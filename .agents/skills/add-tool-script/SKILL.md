---
type: Skill
name: add-tool-script
title: "Criar Ferramenta"
description: "REGRA DE ROTEAMENTO: Use esta skill para criar uma Ferramenta nova na raiz. Não carregue para editar um Perfil de distro."
tags: [script, ferramenta, scaffolding]
---

# Criar Ferramenta

## Pré-condição

- Leia `rules/02-tech-stack-conventions.md`.
- Confirme o nome do programa e a URL de origem com o humano quando a URL for nova.

## Passos

1. Crie `<Nome>.sh` na raiz.
2. Grave o shebang `#!/usr/bin/env bash`.
3. Copie a Guarda de root de `php8.sh`.
4. Declare URL e entrada no bloco VARIÁVEIS.
5. Peça segredo com `read`. Não grave o segredo no Script.
6. Instale com APT, pacote `.deb` ou arquivo oficial. Escolha um canal só.
7. Encerre com `read -s -n 1` e `exit`.
8. Adicione no README o bloco curl e o bloco wget da CDN.
9. Use a URL `https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Nome>.sh`.
10. Atualize `CAPABILITY_MAP.md`, `PRODUCT.md` e `TECH.md`.
11. Execute `bash -n <Nome>.sh`.

## Contrato do README

```bash
bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Nome>.sh)"
```

```bash
bash -c "$(wget https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Nome>.sh -O -)"
```

## Pare

- Pare e peça aprovação antes de adicionar repositório APT novo.
- Pare e peça aprovação antes de trocar `@master`.

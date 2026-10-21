---
type: Specification
title: "Arquitetura técnica"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de mudar contrato, URL ou integração. Não carregue para ajuste de texto do README."
tags: [tecnico, bash, contratos]
scope: "*.sh"
---

# Arquitetura técnica

## Stack

- Linguagem: Bash.
- Shebang padrão: `#!/usr/bin/env bash`.
- Exceção: `rmContainer.sh` usa `#!/bin/bash`.
- Sistema alvo: Linux da família Debian, via APT.
- Não há manifesto de dependência, framework, ORM, banco de aplicação nem CI.
- Editor: `.vscode/settings.json` fixa encoding UTF-8.

## Distribuição

- Remote Git: `git@alvesbeto.github.com:alvesbeto/ShellScript.git`.
- Branch local: `main`.
- URL pública do README: `https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Script>`.
- Comando curl: `bash -c "$(curl -fsSL <URL>)"`.
- Comando wget: `bash -c "$(wget <URL> -O -)"`.
- `/bin/sh` é dash. dash rejeita `[[`.

## Contrato de uma Ferramenta

- Recusa root quando tem Guarda de root.
- Declara URL no bloco VARIÁVEIS.
- Usa `sudo` no comando APT.
- Encerra com pausa de tecla e `exit`, salvo exceção registrada no produto.

## Integrações ativas

- APT, `dpkg`, PPA `add-apt-repository`, chave GPG e `sources.list.d`.
- Docker APT oficial. O codinome vem do `read` de `docker.sh`.
- API do Cursor: `https://cursor.com/api/download?platform=linux-x64&releaseTrack=stable`.
- Composer: `https://getcomposer.org/installer`.
- Oh My Zsh e tema Powerlevel10k em `zsh.sh`.
- Flatpak em `cursor.sh` (GearLever) e em `MintInstall.sh`.
- Snap em `MintInstall.sh`.

## Versões de PHP gravadas nos Scripts

- `php8.sh` instala PHP 8.5 e remove o Apache.
- `MintInstall.sh` lista PHP 8.5.
- `UbuntuServerInstall.sh` remove PHP 8.0 e PHP 8.1.
- `UbuntuServerInstall.sh` instala PHP 8.5 com `libapache2-mod-php8.5`.

## Codinomes Wine gravados nos Scripts

- `UbuntuBasedInstall.sh`: `noble`.
- `MintInstall.sh` e `wine.sh`: `focal`.

## Estado que o agente preserva

- `chamar_ferramenta` prefere o arquivo local e usa a CDN `alvesbeto/ShellScript@master` como reserva.
- `wine.sh` grava o prefixo em `$HOME/.wine`.
- `cursor.sh` instala o `.deb` sem chave GPG placeholder.
- `UbuntuServerInstall.sh` grava o VirtualHost na porta 80 com `sudo tee`. O Script encerra sem `reboot`.
- Não há `set -euo pipefail` nos Scripts.
- O codinome Wine continua `noble` no desktop Ubuntu e `focal` no Mint e em `wine.sh`.

## Validação

- Comando: `bash -n <Script>`.
- Lint opcional: `shellcheck <Script>`.
- Não execute o Instalador como teste.

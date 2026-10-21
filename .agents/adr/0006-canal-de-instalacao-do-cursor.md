---
type: Decision
title: "Canal de instalação do Cursor"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de alterar `cursor.sh`. Não carregue este arquivo para outras Ferramentas."
tags: [adr, cursor]
---

# ADR 0006: Canal de instalação do Cursor

Status: aceito

Data: 2026-10-21

## Contexto

Uma regra antiga em `.cursor/rules/cursor_script_terminal_fix.mdc` descrevia um wrapper `setsid` em `/usr/local/bin/cursor`. O `cursor.sh` atual não grava esse wrapper.

O Script atual consulta `https://cursor.com/api/download?platform=linux-x64&releaseTrack=stable`. O operador escolhe pacote `.deb` ou AppImage com GearLever. O Script exige `/etc/debian_version` e instala `libfuse2` e `fuse3`.

O ramo `.deb` tinha a URL `https://chave.gpg.url` e movia `/etc/apt/trusted.gpg`. Essa sequência foi removida em 2026-10-21.

## Decisão

- Mantenha os dois canais: pacote `.deb` e AppImage.
- Não reintroduza o wrapper `setsid` sem Spec aprovada.
- Instale o pacote `.deb` com `wget` e `dpkg`. Não altere `/etc/apt/trusted.gpg`.

## Consequências

- O terminal deixa de depender do wrapper antigo.
- Falha ao ler a API encerra `cursor.sh` com status 1.
- `flatpak remote-add` não recebe `-y`.

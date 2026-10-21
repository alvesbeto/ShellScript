---
type: Decision
title: "CDN jsDelivr"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de alterar URL de invocação. Não carregue para editar só comandos APT."
tags: [adr, cdn, distribuicao]
---

# ADR 0004: CDN jsDelivr

Status: aceito

Data da decisão original: 2024-12-27

Data do registro: 2026-10-21

## Contexto

O conteúdo raw do GitHub respondeu 429. Os Scripts deixaram de rodar por `curl` e `wget` direto nesse host. A regra antiga está migrada de `.cursor/rules/github-rate-limit-solution.mdc`.

## Decisão

- Publique a invocação principal pela CDN jsDelivr.
- Use o formato `https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Script>`.
- Mantenha `curl -fsSL` e `wget -O -` no README.
- Execute essa URL com `bash -c`. `/bin/sh` é dash e rejeita `[[`.
- Não troque `@master` sem aprovação. O branch Git local é `main`.

## Consequências

- O operador executa o Script sem clonar o repositório.
- `UbuntuBasedInstall.sh` chama `alvesbeto/ShellScript@master` pela função `chamar_ferramenta`.

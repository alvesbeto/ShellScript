---
type: Decision
title: "Registrar decisões de arquitetura"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de criar ou substituir um ADR. Não carregue este arquivo para editar um Script."
tags: [adr, processo]
---

# ADR 0001: Registrar decisões de arquitetura

Status: aceito

Data: 2026-10-21

## Contexto

O repositório não tinha registro de decisões. Regras antigas estavam em `.cursor/rules/*.mdc`.

## Decisão

- Grave cada decisão estrutural em `.agents/adr/`.
- Numere o arquivo com quatro dígitos.
- Não apague um ADR aceito.
- Marque um ADR substituído com status `superseded`.
- Aponte o ADR novo no ADR antigo.

## Consequências

- O agente lê `adr/index.md` antes de mudar uma decisão.
- O agente cria um ADR novo quando a decisão muda.
- As regras `.mdc` antigas não voltam para `.cursor/rules/`.

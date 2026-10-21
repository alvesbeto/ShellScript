---
type: Skill
name: validate-scripts
title: "Validar Scripts"
description: "REGRA DE ROTEAMENTO: Use esta skill antes de concluir uma edição em Script. Não carregue para escrever uma Spec."
tags: [validacao, bash, shellcheck]
---

# Validar Scripts

## Passos

1. Liste os Scripts alterados.
2. Execute `bash -n <Script>` em cada arquivo da lista.
3. Execute `shellcheck <Script>` quando o comando existir.
4. Corrija cada erro de `bash -n` antes de concluir.
5. Informe avisos de `shellcheck` na entrega.

## Bloqueio

- Falha de `bash -n` bloqueia a conclusão.
- Não execute o Script.
- Não use `sudo`.
- Não rode `curl | sh`.

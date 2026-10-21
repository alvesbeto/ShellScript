---
type: Rule
title: "Validação de Scripts"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de concluir uma edição em Script. Não carregue este arquivo para escrever uma Spec."
tags: [teste, bash, validacao]
scope: "*.sh"
---

# Validação de Scripts

O repositório não tem suíte de testes. O repositório não tem CI.

## Verificação obrigatória

- Execute `bash -n <Script>` em cada Script alterado.
- Corrija a falha de sintaxe antes de concluir.
- Não ignore falha de `bash -n`.

## Verificação opcional

- Execute `shellcheck <Script>` quando o comando existir no sistema.
- Registre o aviso de `shellcheck` na entrega. Não bloqueie a entrega por aviso antigo.

## Proibido

- Não execute um Instalador para validar a edição.
- Não use `sudo` na verificação.
- Não rode `curl | sh` contra este computador.
- Não apague a Guarda de root para obter execução verde.

A auditoria de 2026-10-21 executou `bash -n` nos 17 Scripts. Todos passaram na sintaxe.

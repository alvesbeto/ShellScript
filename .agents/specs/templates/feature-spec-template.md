---
type: Specification
title: "Template de Spec de feature"
description: "REGRA DE ROTEAMENTO: Use este arquivo como cópia ao criar uma Spec de feature. Não carregue este arquivo durante a implementação."
tags: [template, spec]
scope: "specs/features/**"
---

# Spec: [module-id]

Status: rascunho

## Objetivo

Grave o resultado visível para o operador. Grave o critério de sucesso.

## Escopo

- Inclui: liste os Scripts.
- Não inclui: liste o que permanece fora.

## Premissas

- Liste cada premissa em um item.
- Pare e pergunte quando a premissa mudar o contrato.

## Comandos

- Sintaxe: `bash -n <Script>`
- Lint opcional: `shellcheck <Script>`

## Contratos

- Entrada: argumento, `read` ou nenhum.
- Saída: pacote, arquivo ou serviço.
- URL nova: peça aprovação antes de gravar.

## Testes

- Execute `bash -n` em cada Script da Spec.
- Não execute o Instalador.
- Grave o resultado esperado da sintaxe.

## Boundaries

- Always: siga `rules/00-global-boundaries.md`.
- Ask first: repositório APT, URL nova, remoção de pacote, contrato do README.
- Never: implementar esta Spec no turno em que ela foi criada.

## Critérios de aceite

- Liste condições observáveis.
- Uma condição por item.

## Pontos abertos

- Liste cada ponto sem resposta.
- Apague o item só depois da resposta humana.

STOP GATE: salve este arquivo. Resuma os pontos abertos. Peça aprovação. Encerre o turno.

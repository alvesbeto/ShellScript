---
type: Document
title: "Entrada de agentes"
description: "REGRA DE ROTEAMENTO: Leia este arquivo no início de cada tarefa neste repositório. Não carregue as specs inteiras a partir daqui."
tags: [entrada, boundaries]
---

# AGENTS

Leia [index.md](index.md) antes de buscar no repositório.

Carregue só o arquivo que a tarefa exige.

`.cursor` e `.claude` são links para `.agents`. Não substitua esses links por diretórios.

## ALWAYS DO

- Consulte `.agents/index.md` antes de buscar no repositório.
- Siga a arquitetura em `rules/01-architecture-patterns.md`.
- Execute `bash -n` em cada Script alterado antes de concluir.
- Atualize `specs/PRODUCT.md` e `specs/TECH.md` na mesma entrega quando o design mudar.

## ASK FIRST

- Altere remoção de pacotes, purge ou estado permanente do sistema.
- Adicione dependência externa, repositório APT ou URL de download.
- Altere o contrato de invocação no README.
- Execute um Script neste computador.

## NEVER DO

- Escreva feature que altera mais de um Script sem Spec aprovada.
- Remova a Guarda de root para contornar uma falha.
- Exponha token, senha ou chave.
- Edite árvore de terceiros em `/opt` ou cache de pacotes.
- Passe da Spec para a implementação no mesmo turno.
- Substitua os links `.cursor` e `.claude` por diretórios.

## Comandos

- Sintaxe: `bash -n <Script>`
- Lint opcional: `shellcheck <Script>`

O detalhe operacional está em [rules/00-global-boundaries.md](rules/00-global-boundaries.md).

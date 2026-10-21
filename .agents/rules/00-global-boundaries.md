---
type: Rule
title: "Limites globais"
description: "REGRA DE ROTEAMENTO: Use este arquivo no início de qualquer tarefa. Não carregue este arquivo para consultar só um ADR."
tags: [boundaries, comandos]
scope: "**"
---

# Limites globais

O repositório é um catálogo de Scripts Bash. Cada Script instala software em Linux da família Debian.

## ALWAYS DO

- Consulte `.agents/index.md` antes de buscar no repositório.
- Siga os padrões em `01-architecture-patterns.md`.
- Execute `bash -n` em cada Script alterado antes de concluir.
- Atualize `specs/PRODUCT.md` e `specs/TECH.md` na mesma entrega quando o design mudar.
- Preserve a Guarda de root nos Scripts que já a possuem.
- Use `$HOME` ou `$PASTA_USUARIO` em caminho de usuário novo.

## ASK FIRST

- Altere remoção de pacotes, purge ou estado permanente do sistema.
- Adicione dependência externa, repositório APT ou URL de download.
- Altere pipeline de CI ou arquivo de infraestrutura.
- Altere o contrato de invocação no README.
- Execute um Script neste computador.
- Adicione a Guarda de root em Script que hoje aceita root.

## NEVER DO

- Escreva feature que altera mais de um Script sem Spec aprovada.
- Remova a Guarda de root para contornar uma falha.
- Apague um teste ou ignore falha de `bash -n` para forçar conclusão verde.
- Exponha token, senha ou chave.
- Edite árvore de terceiros em `/opt` ou cache de pacotes.
- Passe da Spec para a implementação no mesmo turno.
- Substitua os links `.cursor` e `.claude` por diretórios.
- Grave um segredo dentro de um Script.

## Comandos

- Sintaxe: `bash -n <Script>`
- Lint opcional: `shellcheck <Script>`
- Não execute um Instalador como verificação.

## Termos

- Script: arquivo `.sh` executável na raiz.
- Ferramenta: Script que instala um programa.
- Perfil de distro: Script que provisiona um desktop ou um servidor.
- Guarda de root: bloco que encerra o Script quando `EUID` é 0.
- APT: gerenciador de pacotes Debian.
- CDN: jsDelivr, usada na invocação remota.

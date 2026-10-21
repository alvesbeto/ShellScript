---
type: Decision
title: "Guarda de root"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de alterar a Guarda de root. Não carregue este arquivo para validar sintaxe."
tags: [adr, root, seguranca]
---

# ADR 0003: Guarda de root

Status: aceito

Data: 2026-10-21

## Contexto

A maioria dos Scripts encerra quando `EUID` é 0. O operador usa `sudo` só nos comandos APT. Quatro Scripts não têm essa guarda.

## Decisão

- Preserve a Guarda de root nos Scripts que já a possuem.
- Copie a guarda de `php8.sh` em Ferramenta nova.
- Trate como exceção: `composer.sh`, `removeApacheNginx.sh`, `rmContainer.sh`, `UbuntuServerInstall.sh`.
- Peça aprovação antes de adicionar ou remover a guarda nesses quatro Scripts.

## Consequências

- Ferramenta nova recusa execução como root.
- O agente não remove a guarda para contornar falha.

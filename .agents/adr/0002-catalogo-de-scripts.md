---
type: Decision
title: "Catálogo plano de Scripts"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de extrair biblioteca ou mover um Script. Não carregue este arquivo para corrigir sintaxe."
tags: [adr, arquitetura, script]
---

# ADR 0002: Catálogo plano de Scripts

Status: aceito

Data: 2026-10-21

## Contexto

Os Instaladores estão na raiz. Não há função compartilhada. Não há subpasta de código. Perfis de distro repetem o mesmo esqueleto APT.

## Decisão

- Mantenha um Script por Ferramenta.
- Mantenha um Script por Perfil de distro.
- Mantenha o fluxo linear na Ferramenta.
- Não extraia biblioteca compartilhada.
- Copie o Perfil de distro mais próximo quando criar outro perfil.

## Consequências

- Uma correção de esqueleto exige edição em cada Perfil de distro afetado.
- O agente não refatora o catálogo para uma biblioteca sem Spec aprovada.
- O ADR 0007 permite a função `chamar_ferramenta` em `UbuntuBasedInstall.sh`.

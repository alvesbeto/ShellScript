---
type: Rule
title: "Padrões de arquitetura"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de criar, dividir ou extrair um Script. Não carregue este arquivo para corrigir só a sintaxe."
tags: [arquitetura, script]
scope: "*.sh"
---

# Padrões de arquitetura

O repositório não usa camadas, DDD, MVC nem Clean Architecture.

## Catálogo plano

- Coloque cada Script na raiz.
- Crie um Script por Ferramenta.
- Crie um Script por Perfil de distro.
- Não extraia biblioteca compartilhada.
- Mantenha o fluxo linear na Ferramenta.
- Use `chamar_ferramenta` só em `UbuntuBasedInstall.sh`. Veja ADR 0007.

## Direção de dependência

- Um Perfil de distro pode chamar uma Ferramenta.
- Uma Ferramenta não chama um Perfil de distro.
- `chamar_ferramenta` executa o arquivo local quando ele existe.
- `chamar_ferramenta` usa a CDN quando o arquivo local não existe.

## Padrões presentes

- Guarda de root: o Script encerra quando `EUID` é 0. Veja ADR 0003.
- Estratégia por arquivo: cada distro tem o próprio Perfil de distro.
- Esqueleto repetido: os Perfis de distro copiam a mesma sequência APT.
- Entrada interativa: `read` coleta codinome, token ou domínio.
- Argumento posicional: `rmContainer.sh` exige o ID do container em `$1`.

## Proibido nesta arquitetura

- Não una Perfis de distro em um Script só.
- Não introduza `set -euo pipefail` em Script existente sem aprovação.
- Não mova Script para subpasta.

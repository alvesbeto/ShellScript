---
type: Skill
name: add-distro-profile
title: "Criar Perfil de distro"
description: "REGRA DE ROTEAMENTO: Use esta skill para criar um Perfil de distro novo. Não carregue para criar uma Ferramenta."
tags: [script, distro, scaffolding]
---

# Criar Perfil de distro

## Pré-condição

- Leia `rules/01-architecture-patterns.md`.
- Escolha o Perfil de distro mais próximo como origem da cópia.

## Origem da cópia

- Desktop Ubuntu: `UbuntuBasedInstall.sh`
- Desktop Debian: `DebianBasedInstall.sh`
- Desktop Mint: `MintInstall.sh`
- Servidor Ubuntu: `UbuntuServerInstall.sh`

## Passos

1. Copie o Perfil de distro mais próximo para um arquivo novo na raiz.
2. Mantenha a Guarda de root quando a origem a possui.
3. Troque codinome APT, lista de pacotes e versão do PHP só nesse arquivo.
4. Não extraia biblioteca compartilhada.
5. Não una este perfil com outro Perfil de distro.
6. Registre o módulo em `CAPABILITY_MAP.md`.
7. Atualize `PRODUCT.md` e `TECH.md`.
8. Adicione curl e wget no README quando o perfil for público.
9. Execute `bash -n` no arquivo novo.

## Pare

- Pare e peça aprovação antes de remover Apache, Nginx ou PHP.
- Pare e peça aprovação antes de chamar outra Ferramenta pela CDN.

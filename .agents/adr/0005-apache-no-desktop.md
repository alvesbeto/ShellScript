---
type: Decision
title: "Apache no desktop e no servidor"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de alterar Apache, Nginx ou a remoção deles. Não carregue este arquivo para instalar uma Ferramenta sem relação."
tags: [adr, apache, nginx, php]
---

# ADR 0005: Apache no desktop e no servidor

Status: aceito

Data: 2026-10-21

## Contexto

`php8.sh` para e remove o Apache depois de instalar PHP. `removeApacheNginx.sh` para Apache e Nginx e remove os pacotes Nginx e Apache. `UbuntuServerInstall.sh` instala Apache, habilita módulos e abre o perfil UFW `Apache Full`. A regra antiga em `.cursor/rules/remove-apache-nginx.mdc` citava `removeApache.sh`. O arquivo local é `removeApacheNginx.sh`.

## Decisão

- No desktop, a instalação de PHP remove o Apache.
- `removeApacheNginx.sh` remove Apache e Nginx.
- No servidor, `UbuntuServerInstall.sh` instala e mantém o Apache.
- Não aplique a remoção do desktop no Perfil de distro de servidor.
- Não renomeie `removeApacheNginx.sh` sem Spec aprovada.

## Consequências

- `UbuntuBasedInstall.sh` chama `removeApacheNginx.sh`.
- O agente mantém esse nome de arquivo.

---
type: Decision
title: "Correções do catálogo"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de mudar PHP, chamar_ferramenta ou o fim do servidor. Não carregue para uma Ferramenta isolada."
tags: [adr, php, servidor]
---

# ADR 0007: Correções do catálogo

Status: aceito

Data: 2026-10-21

## Contexto

O catálogo tinha chamadas para um dono Git inexistente, variável vazia, prefixo Wine fixo e código depois de `exit`. PHP 8.0 e PHP 8.1 estão fora de suporte. `php8.sh` já instala PHP 8.5.

## Decisão

- Instale PHP 8.5 em `php8.sh`, `MintInstall.sh` e `UbuntuServerInstall.sh`.
- No servidor, use `libapache2-mod-php8.5` e mantenha o Apache.
- Grave VirtualHost com `sudo tee` na porta 80, sem redirecionar para HTTPS.
- Encerre `UbuntuServerInstall.sh` sem `reboot` e sem Keycloak.
- Não clone `https://github.com/betosouzace/ultimate`. Esse URL responde 404.
- Permita a função `chamar_ferramenta` somente em `UbuntuBasedInstall.sh`.
- Grave o prefixo Wine em `$HOME/.wine`.

## Consequências

- O ADR 0002 aceita essa única função.
- Um agente não reinstala PHP 8.0 nem PHP 8.1.
- Um agente não devolve o `reboot` nem o bloco Keycloak sem Spec aprovada.

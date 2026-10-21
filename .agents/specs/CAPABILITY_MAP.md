---
type: Specification
title: "Mapa de capacidades"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de cruzar mais de um Script. Não carregue este arquivo para um ajuste interno de uma única Ferramenta."
tags: [mapa, modulos]
scope: "*.sh"
---

# Mapa de capacidades

Cada módulo é um Script na raiz. Não há ciclo de build. A verificação é `bash -n`.

| Id do módulo | Script | Responsabilidade | Depende de |
|---|---|---|---|
| ubuntu-desktop | UbuntuBasedInstall.sh | Provisiona desktop Ubuntu. | php-composer, docker, postman, cursor-editor, zsh-shell, web-server-removal (chamada remota) |
| debian-desktop | DebianBasedInstall.sh | Provisiona desktop Debian e grava Git. | — |
| mint-desktop | MintInstall.sh | Provisiona desktop Linux Mint. | — |
| ubuntu-server | UbuntuServerInstall.sh | Provisiona servidor Ubuntu com Apache e MariaDB. | — |
| php-composer | php8.sh, composer.sh | Instala PHP e Composer. | — |
| docker | docker.sh, rmContainer.sh | Instala Docker e remove um container. | — |
| cursor-editor | cursor.sh | Instala o Cursor. | — |
| windsurf-editor | windsurf.sh | Instala o Windsurf. | — |
| zsh-shell | zsh.sh | Instala Zsh, Oh My Zsh e Powerlevel10k. | — |
| ngrok | ngrok.sh | Instala o ngrok e grava o token. | — |
| anydesk | anydesk.sh | Instala o AnyDesk pelo repositório APT. | — |
| postman | postman.sh | Instala o Postman em `/opt/Postman`. | — |
| wine | wine.sh | Instala Lutris e WineHQ. | — |
| xampp | XamppInstall.sh | Instala XAMPP 5.5.38. | — |
| web-server-removal | removeApacheNginx.sh | Remove Apache e Nginx. | — |

Ordem de leitura: Ferramenta independente, depois o Perfil de distro que a chama.

`ubuntu-desktop` chama `php8.sh`, `docker.sh`, `postman.sh`, `removeApacheNginx.sh`, `cursor.sh` e `zsh.sh` por `chamar_ferramenta`. O arquivo local tem prioridade. A CDN de reserva é `alvesbeto/ShellScript@master`.

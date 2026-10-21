---
type: Specification
title: "Comportamento do catálogo"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de mudar comportamento do operador. Não carregue para consultar só sintaxe Bash."
tags: [produto, comportamento]
scope: "*.sh"
---

# Produto

O operador provisiona um Linux da família Debian. O operador executa um Script na raiz ou pela CDN, sem clonar o repositório.

## Fluxos

1. O operador copia o bloco curl ou wget do README.
2. O Script recusa root quando possui Guarda de root.
3. O Script pede codinome, token, usuário Git ou domínio quando a Ferramenta exige entrada.
4. O Script instala pacotes com `sudo`.
5. O Script pede uma tecla e encerra. `UbuntuServerInstall.sh` não reinicia a máquina.

## Entradas do operador

- `docker.sh` pede o codinome Ubuntu: `focal`, `jammy` ou `noble`.
- `ngrok.sh` pede o token. O Script não guarda um token padrão ativo.
- `DebianBasedInstall.sh` pede usuário e e-mail Git.
- `cursor.sh` pede o canal `1` (`.deb`) ou `2` (AppImage).
- `UbuntuServerInstall.sh` pede o domínio. Domínio vazio encerra o Script.
- `rmContainer.sh` exige o ID do container em `$1`.

## Comportamento por grupo

- Perfil de desktop: atualiza APT, adiciona repositórios, instala pacotes e baixa `.deb`.
- `php8.sh`: instala PHP 8.5 e remove o Apache.
- `UbuntuServerInstall.sh`: instala PHP 8.5, Apache e MariaDB. O Script mantém o Apache.
- `removeApacheNginx.sh`: para Apache e Nginx e remove os pacotes.
- `postman.sh`: extrai o Postman em `/opt/Postman` e grava o atalho desktop.
- `zsh.sh`: define Zsh como shell e copia `p10k configure` para a área de transferência.
- `wine.sh`: cria prefixo Wine 32 bits em `$HOME/.wine`.

## Critérios de aceite do catálogo atual

- O README executa curl e wget com `bash -c` para UbuntuBasedInstall, docker, cursor e ngrok.
- A URL pública usa `cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/`.
- Script com Guarda de root encerra quando `EUID` é 0.
- `bash -n` passa em cada Script alterado.

## Fora do comportamento ativo

- `UbuntuServerInstall.sh` não instala Keycloak e não clona repositório de aplicação.
- O XAMPP dentro de `UbuntuBasedInstall.sh` está comentado. O instalador ativo é `XamppInstall.sh`.

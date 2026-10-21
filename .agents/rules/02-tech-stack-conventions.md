---
type: Rule
title: "Convenções Bash e APT"
description: "REGRA DE ROTEAMENTO: Use este arquivo antes de editar um arquivo `.sh`. Não carregue este arquivo para escrever uma Spec."
tags: [bash, apt, convencoes]
scope: "*.sh"
---

# Convenções Bash e APT

## Shebang

- Script novo usa `#!/usr/bin/env bash`.
- `rmContainer.sh` usa `#!/bin/bash`. Preserve esse shebang.

## Guarda de root

Copie este bloco para Ferramenta nova:

```bash
if [[ $EUID -eq 0 ]]; then
  clear
  echo "                       !!! ATENÇÃO !!!"
  echo "              NÃO execute este script como root!"
  echo "              Presione qualquer tecla para sair..."
  read -s -n 1 -p " "
  exit
fi
```

Scripts sem Guarda de root: `composer.sh`, `removeApacheNginx.sh`, `rmContainer.sh`, `UbuntuServerInstall.sh`.

Não adicione a Guarda de root nesses quatro Scripts sem aprovação.

## Forma do Script

- Escreva mensagens ao operador em português.
- `cursor.sh` está em inglês. Preserve o idioma desse Script.
- Declare URL e entrada no bloco `# ----------------------------- VARIÁVEIS ----------------------------- #`.
- Marque cada etapa com um comentário `##`.
- Encerre Ferramenta nova com `read -s -n 1` e `exit`.
- Peça segredo com `read`. Não grave o segredo no Script.
- Use `sudo` nos comandos APT. O Script em si recusa root quando tem Guarda de root.
- Atualize o índice APT depois de adicionar um repositório APT.

## Caminhos

- Use `$HOME` ou `$PASTA_USUARIO`.
- Não grave um caminho `/home/<usuário>`.

## Invocação pública

O README publica este formato:

`bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/alvesbeto/ShellScript@master/<Script>)"`

- Execute o Script com `bash`. `/bin/sh` é dash e rejeita `[[`.
- Não troque `@master` sem aprovação. O branch Git local é `main`.

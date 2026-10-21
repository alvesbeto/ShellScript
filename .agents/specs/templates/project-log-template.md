---
type: Specification
title: "Template de log de projeto"
description: "REGRA DE ROTEAMENTO: Use este arquivo como cópia ao abrir PROJECT_LOG de feature longa. Não carregue este arquivo para uma Ferramenta de um arquivo só."
tags: [template, log]
scope: "specs/features/**"
---

# PROJECT_LOG: [module-id]

Grave o checkpoint mais recente no topo.

## YYYY-MM-DD: [checkpoint]

- Feito: grave o passo concluído.
- Arquivos: liste os caminhos.
- Verificação: grave o comando e o resultado.
- Descartado: grave o caminho que não será repetido.
- Próximo: grave o próximo passo aprovado.

## Decisões locais

Grave decisão de feature em `DECISIONS.md` ao lado deste log.

Não duplique ADR estrutural aqui. Aponte o ADR em `.agents/adr/`.

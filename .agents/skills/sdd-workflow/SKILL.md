---
type: Skill
name: sdd-workflow
title: "Workflow SDD"
description: "REGRA DE ROTEAMENTO: Use esta skill quando a demanda exige Spec. Não carregue para ajuste de sintaxe em um Script."
tags: [sdd, spec, gate]
---

# Workflow SDD

Opere em fases. Não avance de fase sem o gate da fase atual.

Grave artefatos em `.agents/specs/`.

## Phase 0 — Capability Map

Execute esta fase só quando a demanda junta capacidades independentes.

- Atualize `.agents/specs/CAPABILITY_MAP.md`.
- Defina o id do módulo, a responsabilidade e a dependência.
- Peça aprovação humana do mapa.
- Encerre o turno. Não escreva a Spec neste turno.

Pule esta fase quando a demanda cobre um único módulo.

## Phase 1 — Specify

- Copie `.agents/specs/templates/feature-spec-template.md`.
- Grave a Spec em `.agents/specs/features/<module-id>.md`.
- Preencha Objetivo, Escopo, Contratos, Testes e Boundaries.
- Liste premissas e pontos abertos no fim da Spec.

STOP GATE:

- Salve a Spec.
- Resuma os pontos abertos.
- Peça aprovação humana.
- Encerre o turno.
- Não planeje a implementação neste turno.
- Não escreva código neste turno.

## Phase 2 — Plan

Execute esta fase só depois da aprovação da Spec.

- Ordene o trabalho pela dependência do mapa.
- Grave o plano em `.agents/specs/features/<module-id>-plan.md`.
- Registre risco e o ponto de verificação de cada etapa.

## Phase 3 — Tasks

- Quebre o plano em tarefas atômicas.
- Limite cada tarefa a cerca de 5 arquivos.
- Grave em cada tarefa o comando de verificação.
- Ofereça `PROJECT_LOG.md` e `DECISIONS.md` quando a feature cruzar vários Scripts.
- Use `.agents/specs/templates/project-log-template.md` para o log.

## Phase 4 — Implement and Sync

Execute esta fase só depois da aprovação do plano e das tarefas.

- Implemente na ordem das tarefas.
- Execute `bash -n` em cada Script alterado.
- Atualize `PRODUCT.md` e `TECH.md` na mesma entrega.
- Atualize a Spec quando o contrato mudar.

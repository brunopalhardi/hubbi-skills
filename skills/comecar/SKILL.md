---
name: comecar
description: Use quando a pessoa disser /comecar, "vamos começar", "primeira vez aqui", ou quando não existir CLAUDE.md na pasta de trabalho. Entrevista inicial que monta o manual da pessoa (CLAUDE.md), as pastas, a memória e o versionamento automático.
---

# /comecar — a primeira conversa

Você está falando com uma pessoa que provavelmente NUNCA usou uma
ferramenta como esta. Tom: acolhedor, simples, sem pressa. Nenhum jargão
sem explicação de 1 frase.

Se já existir um `CLAUDE.md` na pasta atual, pare e pergunte: "Você já
começou antes — quer ajustar o que existe ou refazer do zero?" Só refaça
com confirmação.

## Etapa 1 — Entrevista (2 rodadas curtas)

Faça as perguntas em rodadas, numeradas, cada uma com opções quando
possível e SUA recomendação marcada. Espere as respostas.

**Rodada 1:**
- ❓ **Q1 — Seu nome e o que você faz**: nome, empresa/atividade e ramo.
- ❓ **Q2 — Seu dia a dia**: o que toma mais tempo na sua semana de trabalho?
- ❓ **Q3 — O que você quer que eu ajude a fazer?** Opções: A) automatizar
  tarefas repetidas · B) criar textos, propostas e apresentações ·
  C) analisar números e planilhas · D) construir ferramentas próprias ·
  E) tudo isso. ➡️ Pode escolher mais de uma.

**Rodada 2:**
- ❓ **Q4 — Como você prefere que eu responda?** A) curto e direto ·
  B) explicando o porquê das coisas. ➡️ Recomendo B no começo — dá para
  mudar depois.
- ❓ **Q5 — Quanto você entende de tecnologia?** A) nada, me trate como
  leigo total · B) uso bem o computador, mas nunca programei · C) já
  mexi com código. ➡️ Sem vergonha: a resposta só calibra como eu explico.

## Etapa 2 — Montar as pastas

Na pasta atual, crie:

```
Projetos/        ← um projeto por pasta
Identidades/     ← manuais de marca (a skill /identidade preenche)
memoria/         ← o seu caderno (você mantém, a pessoa não mexe)
```

Crie `memoria/MEMORIA.md` com:

```markdown
# Memória — índice

## Onde paramos
- (primeira sessão — nada ainda)

## Sobre a pessoa e o negócio
- (você preenche conforme aprende)
```

## Etapa 3 — Escrever o CLAUDE.md

Preencha este modelo com as respostas da entrevista (substitua os `<...>`;
não deixe nenhum placeholder):

```markdown
# CLAUDE.md — <nome>

## Quem sou
- <nome>, <atividade> — <empresa/ramo>
- Meu dia a dia: <resumo da Q2>
- O que quero do Claude: <resumo da Q3>
- Conhecimento técnico: <resposta da Q5> — me trate de acordo, SEMPRE.

## Como falar comigo (regras duras)
- Português do Brasil, simples e direto. Estilo: <resposta da Q4>.
- TODO termo técnico explicado em 1 frase, na hora, com analogia se ajudar.
- UMA pergunta por vez, com opções (A/B/C) e sua recomendação marcada.
- Mudou algo? Mostre antes/depois com exemplo ou número concreto.
- Nunca me mostre código, comandos ou tela de erro sem eu pedir — diga o
  que significam.

## Segurança (nunca pule)
- CONFIRME comigo antes de: apagar qualquer coisa, enviar algo para
  alguém, publicar algo na internet, gastar dinheiro.
- Nada irreversível sem meu ok explícito.

## Memória
- No começo de TODA sessão, leia `memoria/MEMORIA.md`.
- Aprendeu algo novo sobre mim ou o negócio? Atualize a memória sem eu
  pedir (arquivo do assunto + linha no índice).
- Quando eu disser "bora continuar", leia "Onde paramos" e retome de lá.

## Conversa longa (regra proativa)
- Conversa que já tratou de vários assuntos, ou em que você sente que
  está perdendo detalhes ditos lá atrás, ou barra de status
  amarela/vermelha → proponha VOCÊ MESMO: "vamos guardar e recomeçar
  limpo?" e siga a skill /limpar.
- Nunca espere travar para sugerir.

## Fila de trabalho (uma coisa de cada vez)
- UM assunto por vez. Antes de começar algo novo, confira o "Onde
  paramos": se tem coisa pela metade, pergunte se terminamos aquilo
  primeiro.
- Em projeto de verdade (pasta em `Projetos/`), trabalhe cada tarefa numa
  CÓPIA separada (branch do Git — invisível para mim) e só junte no
  principal quando eu aprovar o resultado.
- Uma entrega por vez: nunca duas mudanças grandes andando juntas.
- Se o projeto tiver publicação (deploy — o ato de colocar a versão nova
  no ar), publique UMA por vez e confira que a anterior terminou antes
  de começar outra.

## Versões (o cofre)
- Tudo em `Projetos/` guarda versões automaticamente (Git por baixo —
  pense num cofre que guarda uma foto de cada etapa do trabalho).
- Guarde uma versão a cada entrega ou mudança importante, com mensagem em
  português dizendo o que mudou.
- NUNCA me peça para rodar comandos de Git — faça você e diga só
  "guardei a versão".

## Identidades
- (a skill /identidade preenche esta seção)

## Minhas pastas
- `Projetos/` — um projeto por pasta
- `Identidades/` — manuais de marca
- `memoria/` — o caderno do Claude (não mexer à mão)
```

## Etapa 4 — Ligar o cofre de versões

Na pasta atual: `git init` (se ainda não for um repositório). Se o git não
tiver nome/e-mail configurados, configure localmente com o nome da pessoa
e `<primeironome>@local` — serve só para assinar as versões guardadas.
Faça o primeiro commit com a mensagem "primeira configuração".
Para a pessoa, diga apenas: "guardei a primeira versão — a partir de
agora nada aqui se perde."

## Etapa 5 — O tour de despedida

Feche mostrando, em uma lista curta, o que ela pode dizer a partir de
agora:
- **"/nova-ideia"** — tirar uma ideia do papel
- **"/duvida"** — quando não entender um termo ou uma tela
- **"/socorro"** — quando algo der errado
- **"/salvar"** — antes de encerrar o dia
- **"/limpar"** — quando a conversa ficar pesada: guarda tudo e recomeça limpo
- **"bora continuar"** — para retomar de onde parou

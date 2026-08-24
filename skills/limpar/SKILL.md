---
name: limpar
description: Use quando a pessoa disser /limpar, "a conversa está lenta/pesada", "vou limpar a conversa", ou quando VOCÊ perceber que a conversa está longa demais e propuser recomeçar. Guarda tudo e ensina a pessoa a dar /clear e retomar limpo com "bora continuar".
---

# /limpar — esvaziar a mesa sem perder nada

Conversa muito longa deixa o Claude mais lento, mais caro e mais
esquecido. A solução é guardar tudo e recomeçar numa conversa limpa —
sem perder o fio. É isso que esta skill faz.

## Quando VOCÊ deve propor isso sozinho

Proponha "vamos guardar e recomeçar limpo?" quando notar qualquer um:

- A conversa já tratou de vários assuntos diferentes;
- Você sente que está perdendo detalhes ditos lá atrás;
- A barra de status embaixo da conversa está amarela ou vermelha
  (é o medidor de quanto da "memória da conversa" já foi usada).

Nunca limpe sem a pessoa concordar.

## O que fazer, na ordem

1. **Guarde o fio** — igual ao encerramento de dia:
   - Reescreva a seção `## Onde paramos` de `memoria/MEMORIA.md` (máx. 5
     linhas): o que foi feito, o que falta, o próximo passo em 1 frase
     começando com verbo.
   - Se houver projeto ativo (mexemos em `Projetos/<nome>/`), atualize
     também a seção `## Onde paramos` do `CADERNO.md` daquele projeto.
   - Aprendizados novos sobre a pessoa ou o negócio → 1 linha cada na
     seção "Sobre a pessoa e o negócio" da memória.

2. **Guarde a versão**: commit de tudo que mudou, mensagem em português.
   Para a pessoa, diga só: "guardei tudo".

3. **Explique em 1 frase o que vai acontecer**: "Limpar a conversa é
   esvaziar a mesa: os papéis não somem — estão todos guardados no
   arquivo; a mesa é que fica livre para trabalhar melhor."

4. **Instrua, literalmente**:
   "Agora digite **/clear** e aperte Enter. Quando a conversa nova
   abrir, diga só **'bora continuar'** que eu retomo exatamente de onde
   paramos."

## Proibições

- Limpar sem guardar antes (as etapas 1 e 2 vêm SEMPRE primeiro).
- Assustar a pessoa: deixe claro que nada se perde.
- Termo técnico sem tradução.

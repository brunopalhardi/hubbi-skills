---
name: nova-ideia
description: Use quando a pessoa disser /nova-ideia, "tenho uma ideia", "quero criar algo", "queria automatizar/fazer X". Entrevista guiada em rodadas que transforma a ideia em plano aprovado antes de qualquer execução.
---

# /nova-ideia — da ideia ao plano aprovado

A pessoa é leiga. Sua missão: entender a ideia COMPLETA antes de fazer
qualquer coisa. Nada executa antes do "pode ir" dela.

## O motor de rodadas (use exatamente assim)

Trate a conversa como uma árvore de decisões: cada resposta abre as
próximas perguntas. Trabalhe em RODADAS: em cada rodada, faça só as
perguntas que já dão para fazer agora (as que não dependem de resposta
que ainda não veio). Formato de cada pergunta:

❓ **Q1 — <título curto>**: <a pergunta, com opções A/B/C quando possível>

➡️ <sua resposta recomendada, em 1 frase, com o porquê>

Regras do motor:
- **Fatos são trabalho SEU**: o que dá para descobrir olhando arquivos ou
  pesquisando, descubra — nunca pergunte o que podia verificar sozinho.
- **Decisões são DELA**: nunca responda uma pergunta sua no lugar da pessoa.
- Máximo de 4 perguntas por rodada. Espere as respostas antes da próxima.
- Acabou quando não sobra pergunta pendente. Aí resuma o que foi decidido
  e confirme: "entendi certo?"

## Passo 1 — Classificar (e dizer em voz alta)

- **Ideia simples**: um texto, uma análise, uma automação pequena — cabe
  numa sessão. Diga: "isso é coisa rápida, vou fazer umas perguntas e já
  montamos."
- **Projeto de verdade**: um mini-sistema, painel, ferramenta — algo que
  cresce com o tempo. Diga: "isso merece virar um projeto com pasta
  própria e um caderno de decisões."

Na dúvida, trate como projeto.

## Caminho A — Ideia simples

1. Entrevista curta (1–2 rodadas com o motor acima).
2. Apresente o plano: passos numerados, em linguagem de negócio, com o
   resultado esperado de cada passo.
3. Pergunte: "posso ir?"
4. Execute, mostre o resultado, e pergunte o que ajustar.

## Caminho B — Projeto de verdade

1. Crie `Projetos/<nome-curto>/` e dentro dela o `CADERNO.md`:

```markdown
# Caderno — <nome do projeto>

## O que é
<1 parágrafo: o que o projeto faz e para quem>

## Onde paramos
- (nada ainda)

## Decisões
- <data> — Escolhemos <X> em vez de <Y> porque <Z>.

## Fora por enquanto
- <o que decidimos NÃO fazer agora, para o projeto não inchar>
```

2. Entrevista completa com o motor de rodadas. CADA decisão tomada entra
   no caderno NA HORA, no formato "Escolhemos X em vez de Y porque Z".
3. Monte o plano em **fatias pequenas**: cada fatia termina em algo que a
   pessoa consegue VER funcionando (uma tela, um arquivo, um resultado).
4. Apresente plano + caderno. Pergunte: "posso começar pela fatia 1?"
5. A cada fatia entregue: mostre funcionando, guarde a versão (commit com
   mensagem em português — para a pessoa, diga só "guardei a versão"),
   atualize "Onde paramos" no caderno.

## Proibições

- Executar antes do "pode ir".
- Jargão sem tradução de 1 frase.
- Perguntar à pessoa algo que você podia descobrir lendo os arquivos dela.

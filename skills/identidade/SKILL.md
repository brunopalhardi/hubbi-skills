---
name: identidade
description: Use quando a pessoa disser /identidade, "identidade visual", "minha marca", "tom de voz", "logo", "padronizar o visual". Cria o manual da marca (empresa, projeto ou pessoal) e faz todo material futuro seguir esse padrão.
---

# /identidade — a cara e a voz da marca

A pessoa pode ter mais de uma identidade (a da empresa, a de um projeto,
a pessoal). Cada uma vive em `Identidades/<nome>/`. Se a pasta
`Identidades/` já tiver conteúdo, pergunte primeiro: nova identidade ou
ajuste de uma existente?

## O motor de rodadas (use exatamente assim)

Trate a conversa como uma árvore de decisões: cada resposta abre as
próximas perguntas. Trabalhe em RODADAS: em cada rodada, faça só as
perguntas que já dão para fazer agora (as que não dependem de resposta
que ainda não veio). Formato de cada pergunta:

❓ **Q1 — <título curto>**: <a pergunta, com opções A/B/C quando possível>

➡️ <sua resposta recomendada, em 1 frase, com o porquê>

Regras do motor:
- **Fatos são trabalho SEU**: arquivos e imagens que a pessoa mandar,
  você lê e descreve — nunca pergunte o que podia ver sozinho.
- **Decisões são DELA**: nunca responda uma pergunta sua no lugar dela.
- Máximo de 4 perguntas por rodada. Espere as respostas antes da próxima.
- Acabou quando não sobra pergunta pendente — resuma e confirme.

## Bloco 1 — De quem é a identidade

Rodada inicial: é da empresa, de um projeto específico ou pessoal? Para
que vai servir (posts, propostas, site, apresentações)? Quem precisa se
sentir atraído por ela (o público)?

## Bloco 2 — Coletar o que já existe

Peça de uma vez, deixando claro que pode arrastar arquivos na conversa:
- Logos (qualquer formato), fotos e imagens que já usa
- Materiais antigos (cartão, post, proposta, apresentação)
- Cores que já usa ou ama/odeia
- 2–3 marcas que admira (de qualquer ramo) e por quê

Leia CADA imagem recebida e descreva o que vê (cores dominantes, estilo,
sensação). Salve tudo em `Identidades/<nome>/arquivos/`. O que não
existir, você propõe no Bloco 3.

## Bloco 3 — Definir, em rodadas

Com o material lido, conduza com o motor:
1. **Paleta**: proponha 2–3 opções de conjunto de cores (com os códigos,
   explicando: "código de cor é o CEP da cor — garante o mesmo tom em
   qualquer lugar"). Baseie no que já existe.
2. **Tipografia**: proponha par de fontes (título + texto) com exemplo.
3. **Estilo de imagem**: foto real, ilustração, ícones? Mostre com
   referência ao material coletado.
4. **Tom de voz**: peça 2–3 textos que a pessoa mesma escreveu (posts,
   mensagens a clientes). Proponha o tom em 3–4 adjetivos + regras
   ("fala 'você', nunca 'vossa'; nada de gíria; humor leve ok") e
   REESCREVA um dos textos dela no tom proposto, para ela aprovar
   comparando. Inclua a lista "o que a marca nunca diz".

## Bloco 4 — Gerar o manual

Crie `Identidades/<nome>/manual-da-marca.md`:

```markdown
# Manual da marca — <nome>

## Essência
<1 parágrafo: o que a marca é, para quem, e a sensação que deve passar>

## Cores
- <nome da cor> — `<código>` — quando usar
(uma linha por cor: principal, apoio, fundo, texto, destaque)

## Tipografia
- Títulos: <fonte> — Texto: <fonte>

## Estilo de imagem
<2–3 linhas do padrão + o que evitar>

## Tom de voz
- Adjetivos: <3–4>
- Regras: <lista curta>
- A marca NUNCA diz: <lista>
- Exemplo aprovado: <o texto reescrito que a pessoa aprovou>

## Arquivos
- Logos e imagens em `arquivos/`
```

Gere também `Identidades/<nome>/amostra.html` — uma página única,
autocontida, mostrando a paleta aplicada, a tipografia e o exemplo de
texto no tom — e abra para a pessoa ver o conjunto vivo antes de aprovar.

## Bloco 5 — Ligar no dia a dia

Com o manual aprovado, acrescente na seção `## Identidades` do
`CLAUDE.md`:

```markdown
- <nome>: `Identidades/<nome>/manual-da-marca.md` — usar em <para que
  serve, ex.: "tudo da empresa">. Todo material desse contexto segue
  este manual (cores, fontes, tom), sem eu precisar lembrar.
```

Guarde a versão (commit; para a pessoa: "guardei a versão") e feche
dizendo, com suas palavras: "a partir de agora, o que eu criar nesse
contexto sai com a cara da sua marca — se quiser algo fora do padrão, é
só me avisar."

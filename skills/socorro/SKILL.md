---
name: socorro
description: Use quando a pessoa disser /socorro, "deu erro", "quebrou", "sumiu", "parou de funcionar", "apaguei sem querer", ou demonstrar susto/frustração com algo que deu errado.
---

# /socorro — deu errado, e agora?

A pessoa está possivelmente assustada. A ordem das coisas importa:

## 1. Acalme PRIMEIRO

Antes de investigar qualquer coisa, diga (com suas palavras):
"Calma — nada está perdido. Todas as versões do seu trabalho estão
guardadas; na pior das hipóteses, voltamos para a última que funcionava."

## 2. Investigue SOZINHO

- Leia as mensagens de erro, os arquivos envolvidos e o histórico de
  versões. Reproduza o problema se der.
- **NUNCA cole tela de erro, log ou código na conversa.** A pessoa não
  vai entender e vai se assustar mais.
- Não pergunte "o que você fez?" em tom de culpa. Se precisar de
  contexto, pergunte: "o que você estava tentando fazer quando parou?"

## 3. Explique em 1 frase

O que aconteceu, em português de gente, com analogia se ajudar:
"O arquivo que guarda as configurações ficou com um pedaço faltando —
como um formulário com um campo rasgado."

## 4. Proponha UMA saída

Uma ação só, com sua recomendação: "Recomendo voltar para a versão de
ontem às 15h, que funcionava. Posso?"
- Se houver mais de um caminho, escolha o mais seguro e ofereça só ele.
  Mencione alternativa apenas se a pessoa recusar.

## 5. Execute e PROVE

- Se for voltar versão: faça pelo Git (restore/checkout por baixo) e
  mostre o resultado funcionando — "voltei, olha aí como estava".
- Confirme com a pessoa que o problema sumiu de verdade.

## 6. Aprenda

Registre na memória (`memoria/MEMORIA.md`, 1 linha) o que causou e como
foi resolvido — para prevenir e para o "bora continuar" de amanhã saber.

## Proibições

- Despejar diagnóstico técnico.
- Mais de uma pergunta por vez.
- Dizer "resolvido" sem a pessoa confirmar que está vendo funcionar.

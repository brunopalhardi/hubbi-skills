# Deixe seu VS Code com a cara do do Bruno

> **Como usar:** abra o Claude Code, mande este arquivo (ou cole o
> conteúdo inteiro) e diga: **"faz isso"**. O resto é com ele.

---

## Instruções para o Claude

Você vai configurar o VS Code e o Claude Code desta pessoa para ficarem
iguais ao setup do Bruno Palhardi. A pessoa é leiga: explique cada coisa
que instalar em 1 frase simples, nunca mostre tela de erro crua, e siga
estas regras **na ordem**:

1. **Descubra o sistema sozinho** (Mac ou Windows) — não pergunte.
2. **Backup antes de mexer**: todo arquivo de configuração que você for
   alterar, copie antes com sufixo `.bak-AAAAMMDD`.
3. **Mescle, nunca substitua**: se um arquivo de configuração já existe,
   preserve as chaves que já estão lá e aplique as daqui por cima.
4. **Se algo falhar, não trave**: pule a etapa, anote, siga — e relate no
   final o que ficou de fora.
5. **No final**: mostre um checklist do que foi feito e peça para a pessoa
   fechar e abrir o VS Code.

### Etapa 1 — Extensões do VS Code

Rode (o comando `code` é o VS Code no terminal):

```
code --install-extension anthropic.claude-code
code --install-extension miguelsolorio.min-theme
code --install-extension miguelsolorio.symbols
```

- Se `code` não existir no Mac: peça à pessoa para abrir o VS Code,
  apertar `Cmd+Shift+P`, digitar "Shell Command: Install 'code' command
  in PATH" e dar Enter. Depois repita os comandos.
- Opcional (visual avançado): `code --install-extension drcika.apc-extension`.
  Se der qualquer problema, desinstale e siga — o visual principal não
  depende dela.

### Etapa 2 — Fonte JetBrains Mono

- **Mac:** `brew install --cask font-jetbrains-mono`. Sem Homebrew?
  Baixe o zip oficial de https://www.jetbrains.com/lp/mono/, abra a pasta
  `fonts/ttf` e instale os arquivos (clique duplo → Instalar fonte).
- **Windows:** tente `winget install -e --id JetBrains.JetBrainsMono`.
  Se o winget não achar, baixe o mesmo zip oficial, extraia, selecione
  todos os `.ttf`, clique com o direito → Instalar.

### Etapa 3 — Aparência do VS Code

Mescle estas chaves no `settings.json` do VS Code
(Mac: `~/Library/Application Support/Code/User/settings.json` ·
Windows: `%APPDATA%\Code\User\settings.json`):

```json
{
    "workbench.startupEditor": "none",
    "workbench.colorTheme": "Min Dark",
    "workbench.iconTheme": "symbols",
    "editor.fontFamily": "JetBrains Mono",
    "editor.fontSize": 14,
    "editor.lineHeight": 1.8,
    "explorer.compactFolders": false,
    "editor.semanticHighlighting.enabled": false,
    "breadcrumbs.enabled": false,
    "workbench.statusBar.visible": false,
    "editor.minimap.enabled": false,
    "claudeCode.preferredLocation": "panel",
    "workbench.activityBar.location": "hidden"
}
```

### Etapa 4 — A barra de status do Claude Code

É a linha que aparece embaixo da conversa mostrando: modelo em uso, quanto
da "memória da conversa" já foi usada (barra de blocos), quanto dos
limites de 5 horas e 7 dias já foi consumido, e quanto falta para o limite
resetar.

- **Mac:**
  1. Garanta o `jq` (um leitorzinho de dados que a barra usa):
     `brew install jq`
  2. Baixe o script para `~/.claude/statusline.sh`:
     `curl -fsSL https://raw.githubusercontent.com/brunopalhardi/hubbi-skills/main/ambiente/statusline.sh -o ~/.claude/statusline.sh && chmod +x ~/.claude/statusline.sh`
  3. Mescle no `~/.claude/settings.json`:

     ```json
     {
       "statusLine": {
         "type": "command",
         "command": "bash ~/.claude/statusline.sh"
       }
     }
     ```

- **Windows:**
  1. Baixe https://raw.githubusercontent.com/brunopalhardi/hubbi-skills/main/ambiente/statusline.ps1
     para `%USERPROFILE%\.claude\statusline.ps1`
  2. Mescle no `%USERPROFILE%\.claude\settings.json`:

     ```json
     {
       "statusLine": {
         "type": "command",
         "command": "powershell -NoProfile -ExecutionPolicy Bypass -File %USERPROFILE%\\.claude\\statusline.ps1"
       }
     }
     ```

### Etapa 5 — Conferir

Peça para a pessoa fechar e abrir o VS Code. Confira com ela:
tema escuro minimalista, fonte nova, interface sem barra lateral de
ícones, Claude Code abrindo no painel de baixo, e a barra de status
aparecendo embaixo da conversa. Mostre o checklist do que foi feito.

---

## O que você acabou de ganhar (para a pessoa, não para o Claude)

| Coisa | O que é |
|---|---|
| Tema Min Dark + ícones Symbols | Visual escuro e limpo, sem poluição. |
| JetBrains Mono | Fonte feita para ler texto de trabalho sem cansar. |
| Interface enxuta | Menos botões e barras = menos distração. |
| Claude no painel | O Claude fica embaixo do seu arquivo, como um assistente de mesa. |
| Barra de status | Você sempre sabe qual modelo está usando, quanto da conversa já foi, e quanto falta para o limite resetar. |

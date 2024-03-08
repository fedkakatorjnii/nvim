`brew install tree-sitter`
`brew install lua-language-server`
`brew install rust-analyzer`
`brew install `
`brew install `
`brew install `

`npm i -g typescript-language-server`
`npm install -g eslint_d`
`npm i -g @tailwindcss/language-server`
`npm i -g `
`npm i -g @fsouza/prettierd`
`npm i -g sql-language-server`
`npm i -g vscode-langservers-extracted`

### markdown

`cargo install languagetool-rust --features full`

`:TSInstall java`
`:TSInstall markdown`
`:TSInstall markdown_inline`

## Фортамирование кода

Для форматирование используется **null_ls**

### lua

**stylua**
Установка - `cargo install stylua`

Использование - `null_ls.builtins.formatting.stylua`

### markdown

**languagetool-rust**

Установка - `cargo install languagetool-rust --features full`
-- Использование - `null_ls.builtins.code_actions.ltrs`

Использование - `null_ls.builtins.formatting.textlint`

vim.cmd("autocmd!")

-- нумерация строк
require("number_toggle")
-- Запоминает где nvim последний раз редактировал файл
require("memory_files_position")
-- подключаем цветовую схему
require("colorscheme")

-- используемая кодировка
vim.scriptencoding = "utf-8"
-- отображаемая кодировка
vim.opt.encoding = "utf-8"
-- кодировка при записи
vim.opt.fileencoding = "utf-8"

--
-- TODO: не вижу разницы
--
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.inccommand = "split"

-- кол-во строк по достижению которого начинается скрол
vim.opt.scrolloff = 10

-- TODO: видимо меняет оболочку на fish
vim.opt.shell = "fish"

-- TODO: что-то для кэширования
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

-- Поиск без учета регистра, ЕСЛИ в поиске нет /C или заглавной буквы
vim.opt.ignorecase = true
-- При включении <Tab> перед строкой вставляет пробелы в соответствии с
-- 'shiftwidth'. 'tabstop' или 'softtabstop' используется в других местах.
vim.opt.smarttab = true

-- Каждая перенесенная строка будет визуально отступлена
-- (то же количество места, что и в начале этой строки),
-- тем самым сохраняя горизонтальные блоки текста
vim.opt.breakindent = true

-- TODO: что-то для отступов???
vim.opt.shiftwidth = 2
-- TODO: что-то для отступов табуляции???
vim.opt.tabstop = 2
-- переносить ли текст не поместившийся на эеране
vim.opt.wrap = false

-- TODO: возврат в режиме вставки???
vim.opt.backspace = { "start", "eol", "indent" }
-- TODO: Поиск файлов — поиск во вложенных папках
vim.opt.path:append({ "**" })
-- TODO: игнорирует файлы, но в каком случае???
vim.opt.wildignore:append({ "*/node_modules/*" })

-- отступ до вертикальной черты
-- vim.opt.colorcolumn = "79"
vim.opt.colorcolumn = "120"

-- TODO: что-то...
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
-- TODO: что-то странное для выхода из режима вставки после вставки???
-- что бы это ни значило
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
-- TODO: что-то странное...
vim.opt.formatoptions:append({ "r" })

-- общий буффер
vim.cmd("set clipboard=unnamedplus")

-- чтобы редактор не моргал когда появляются иконки слева
--
-- TODO: у меня итак не моргает
-- либо воспроизводится только на mac либо уже не актуально
-- либо я выключил уконку
vim.wo.signcolumn = "yes"

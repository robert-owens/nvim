-- Plugin loader - automatically loads all plugin categories
return {
    -- UI plugins
    { import = "plugins.ui" },

    -- Editor plugins
    { import = "plugins.editor" },

    -- LSP plugins
    { import = "plugins.lsp" },

    -- Coding plugins
    { import = "plugins.coding" },

    -- Tool plugins
    { import = "plugins.tools" },
}

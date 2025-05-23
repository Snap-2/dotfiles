local lspconfig = require('lspconfig')

-- SWIFT - SourceKit
lspconfig.sourcekit.setup {
    root_dir = "/bin"
}

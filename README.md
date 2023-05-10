# Rubberduck.nvim

`Rubberduck` is a very small Neovim plugin for use with the Rubberduck python application. 
It simply watches the output of this application in a live-updated window.
You will need to match the settings of the Rubberduck python application.

In case you don't know what the Rubberduck python application does, it listens
for prompts in voice format and outputs asynchronously in text. 

[Python App here](https://github.com/hesiod-au/)

## Installation

```lua
-- Packer
use({
    "hesiod-au/rubberduck.nvim",
    config = function()
        require("rubberduck").setup()
    end,
    requires = { "rktjmp/fwatch.nvim" }
})
```

## Configuration

`rubberduck.nvim` comes with the following defaults, you can override them by passing config as setup param

```lua
{
    srv_pipe_file = "/tmp/nvim_server.pipe",
    start_columns = 80,
    rd_file_path = os.getenv("HOME") .. "/.rubber_duck/rubber_duck.out"
}
```
## Usage

Plugin exposes following command:

#### `openRdSidebar()`
This command:
* Opens the rubberduck application output file in a side window
* Starts a neovim server listening on the pipe file - this is called by the app
* Starts watching for changes to the file and automatically scrolls to the end

This command can be bound to a key combo of your preference.


-- local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-------------------

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}


local TablineFileName = {
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return {
            fg = self.is_active and 'SpringGreen' or 'gray',
            bold = self.is_active or self.is_visible,
            italic = true
        }
    end,
}

local TablineFileFlags = {
    provider = function(self)
        local is_modified = vim.api.nvim_buf_get_option(self.bufnr, "modified")
        if is_modified then
            return "*"
        end

        local is_modifiable = vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
        local is_readonly = vim.api.nvim_buf_get_option(self.bufnr, "readonly")

        if not is_modifiable or is_readonly then
            return ""
        end

        local is_terminal = vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal"
        if is_terminal then
            return ""
        end

        return " "
    end,
    hl = { fg = "orange" },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    on_click = {
        callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
                vim.schedule(function()
                    vim.api.nvim_buf_delete(minwid, { force = false })
                end)
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    -- TablineBufnr,
    FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
    TablineFileName,
    TablineFileFlags,
    {provider = '· ', hl = {fg = 'gray'}}
}

local BufferLine = utils.make_buflist(
    TablineFileNameBlock,
    { provider = "", hl = { fg = "gray" } },
    { provider = "", hl = { fg = "gray" } }
)

require('heirline').setup({
    tabline = BufferLine,
})

vim.cmd [[highlight TabLineFill    cterm=NONE gui=NONE]]
vim.o.showtabline = 2

local M = {}

function MyCmdRename()
    vim.lsp.buf.rename()
end


function MyCmdSignatureWrap()
    vim.cmd.py [[
import re


def signature_wrap(line: str) -> list[str] | None:
    regexp = re.compile(r"^(?P<indent> *)(?P<def>(?:async )?def) (?P<name>\w+)\((?P<args>.*)\)(?P<return>.*):$")
    matched = regexp.match(line)

    if matched is None:
        return None

    d = matched.groupdict()

    answer = []
    answer.append(f"{d['def']} {d['name']}(")
    for arg in d['args'].split(','):
        arg = arg.strip()
        answer.append(f'        {arg},')
    answer.append(f"){d['return']}:")

    answer = [d['indent'] + x for x in answer]
    return answer


def main():
    line = vim.api.get_current_line()
    answer = signature_wrap(line)
    if answer is None:
        print("Signature wrap failed")
    else:
        currentline, _ = vim.api.win_get_cursor(0)
        vim.api.buf_set_lines(0, currentline - 1, currentline, True, answer)

main()
    ]]
end

function M.set_global()
    vim.api.nvim_create_user_command('MyCmdRename', MyCmdRename, {
        desc = "Refactoring: rename via LSP"
    })

    vim.api.nvim_create_user_command('MyCmdSignatureWrap', MyCmdSignatureWrap, {
        desc = "Refactoring: Function signature multiline"
    })
end

return M

local minifiles = require 'mini.files'
minifiles.setup {
  mappings = {
    go_in_plus = '<CR>',
  },
}

vim.keymap.set('n', '-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end)

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id

    -- Schedule to run after kulala's autocmds have set their keymaps
    vim.schedule(function()
      pcall(vim.keymap.del, 'n', '<CR>', { buffer = buf_id })
      vim.keymap.set('n', '<CR>', function()
        MiniFiles.go_in { close_on_file = true }
      end, { buffer = buf_id, desc = 'Open file and close' })
    end)

    vim.keymap.set('n', 'gc', function()
      local fs_entry = MiniFiles.get_fs_entry()
      if not fs_entry then
        return vim.notify('Cursor is not on valid entry', vim.log.levels.WARN)
      end

      -- Get the path - if it's a file, use its parent directory
      local path = fs_entry.path
      if fs_entry.fs_type == 'file' then
        path = vim.fs.dirname(path)
      end

      vim.fn.chdir(path)

      -- Close mini.files so it reopens fresh in the new directory
      MiniFiles.close()
      MiniFiles.open(path, false)

      vim.notify('Set cwd to: ' .. path, vim.log.levels.INFO)
    end, { buffer = buf_id, desc = 'Set cwd to directory' })
  end,
})

{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Keymaps
    keymaps = [
      {
        action = ":Ex<CR>";
        key = "<leader>pv";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}

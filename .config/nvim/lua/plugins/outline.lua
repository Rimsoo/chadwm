return {
  {
    "hedyhli/outline.nvim",
    opts = {
      outline_window = {
        -- Where to open the split window: right/left
        -- position = "left",
        -- The default split commands used are 'topleft vs' and 'botright vs'
        -- depending on `position`. You can change this by providing your own
        -- `split_command`.
        -- `position` will not be considered if `split_command` is non-nil.
        -- This should be a valid vim command used for opening the split for the
        -- outline window. Eg, 'rightbelow vsplit'.
        -- Width can be included (with will override the width setting below):
        -- Eg, `topleft 20vsp` to prevent a flash of windows when resizing.
        split_command = "split",
      },
    },
  },
}

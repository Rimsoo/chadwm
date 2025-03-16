# DWM Cheatsheet

## Layouts

| Symbole | Fonction |
|---------|----------|
| `[]=` | `tile` |
| `[M]` | `monocle` |
| `[@]` | `spiral` |
| `[\\]` | `dwindle` |
| `H[]` | `deck` |
| `TTT` | `bstack` |
| `===` | `bstackhoriz` |
| `HHH` | `grid` |
| `###` | `nrowgrid` |
| `---` | `horizgrid` |
| `:::` | `gaplessgrid` |
| `\|M\|` | `centeredmaster` |
| `>M>` | `centeredfloatingmaster` |
| `><>` | `NULL` |

## Key Bindings

| Modificateur | Touche | Fonction | Argument |
|-------------|--------|----------|----------|
| `0` | `XF86XK_AudioLowerVolume` | `spawn` | `{.v = downvol}` |
| `0` | `XF86XK_AudioMute` | `spawn` | `{.v = mutevol }` |
| `0` | `XF86XK_AudioRaiseVolume` | `spawn` | `{.v = upvol}` |
| `0` | `XF86XK_MonBrightnessUp` | `spawn` | `{.v = light_up}` |
| `0` | `XF86XK_MonBrightnessDown` | `spawn` | `{.v = light_down}` |
| `0` | `XK_Print` | `spawn` | `SHCMD("flameshot gui")` |
| `0` | `XK_F1` | `spawn` | `{.v = helpCmd}` |
| `MODKEY` | `XK_a` | `spawn` | `{.v = rofi }` |
| `MODKEY` | `XK_Return` | `spawn` | `{.v = terminal}` |
| `MODKEY` | `XK_b` | `togglebar` | `{0}` |
| `MODKEY\|ControlMask` | `XK_t` | `togglegaps` | `{0}` |
| `MODKEY\|ShiftMask` | `XK_space` | `togglefloating` | `{0}` |
| `MODKEY` | `XK_f` | `togglefullscr` | `{0}` |
| `MODKEY\|ControlMask` | `XK_w` | `tabmode` | `{ -1 }` |
| `MODKEY` | `XK_j` | `focusstack` | `{.i = +1 }` |
| `MODKEY` | `XK_k` | `focusstack` | `{.i = -1 }` |
| `MODKEY` | `XK_i` | `incnmaster` | `{.i = +1 }` |
| `MODKEY` | `XK_d` | `incnmaster` | `{.i = -1 }` |
| `MODKEY` | `XK_Left` | `shiftview` | `{.i = -1 }` |
| `MODKEY` | `XK_Right` | `shiftview` | `{.i = +1 }` |
| `MODKEY` | `XK_h` | `setmfact` | `{.f = -0.05}` |
| `MODKEY` | `XK_l` | `setmfact` | `{.f = +0.05}` |
| `MODKEY\|ShiftMask` | `XK_h` | `setcfact` | `{.f = +0.25}` |
| `MODKEY\|ShiftMask` | `XK_l` | `setcfact` | `{.f = -0.25}` |
| `MODKEY\|ShiftMask` | `XK_o` | `setcfact` | `{.f =  0.00}` |
| `MODKEY\|ShiftMask` | `XK_j` | `movestack` | `{.i = +1 }` |
| `MODKEY\|ShiftMask` | `XK_k` | `movestack` | `{.i = -1 }` |
| `MODKEY\|ShiftMask` | `XK_Return` | `zoom` | `{0}` |
| `MODKEY` | `XK_Tab` | `view` | `{0}` |
| `MODKEY\|ControlMask` | `XK_i` | `incrgaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask` | `XK_d` | `incrgaps` | `{.i = -1 }` |
| `MODKEY\|ShiftMask` | `XK_i` | `incrigaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_i` | `incrigaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_o` | `incrogaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_o` | `incrogaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_6` | `incrihgaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_6` | `incrihgaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_7` | `incrivgaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_7` | `incrivgaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_8` | `incrohgaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_8` | `incrohgaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_9` | `incrovgaps` | `{.i = +1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_9` | `incrovgaps` | `{.i = -1 }` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_d` | `defaultgaps` | `{0}` |
| `MODKEY` | `XK_t` | `setlayout` | `{.v = &layouts[0]}` |
| `MODKEY\|ShiftMask` | `XK_f` | `setlayout` | `{.v = &layouts[1]}` |
| `MODKEY` | `XK_m` | `setlayout` | `{.v = &layouts[2]}` |
| `MODKEY\|ControlMask` | `XK_g` | `setlayout` | `{.v = &layouts[10]}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_t` | `setlayout` | `{.v = &layouts[13]}` |
| `MODKEY` | `XK_space` | `setlayout` | `{0}` |
| `MODKEY\|ControlMask` | `XK_comma` | `cyclelayout` | `{.i = -1 }` |
| `MODKEY\|ControlMask` | `XK_period` | `cyclelayout` | `{.i = +1 }` |
| `MODKEY` | `XK_0` | `view` | `{.ui = ~0 }` |
| `MODKEY\|ShiftMask` | `XK_0` | `tag` | `{.ui = ~0 }` |
| `MODKEY` | `XK_comma` | `focusmon` | `{.i = -1 }` |
| `MODKEY` | `XK_period` | `focusmon` | `{.i = +1 }` |
| `MODKEY\|ShiftMask` | `XK_comma` | `tagmon` | `{.i = -1 }` |
| `MODKEY\|ShiftMask` | `XK_period` | `tagmon` | `{.i = +1 }` |
| `MODKEY\|ShiftMask` | `XK_minus` | `setborderpx` | `{.i = -1 }` |
| `MODKEY\|ShiftMask` | `XK_p` | `setborderpx` | `{.i = +1 }` |
| `MODKEY\|ShiftMask` | `XK_w` | `setborderpx` | `{.i = default_border }` |
| `MODKEY\|ControlMask` | `XK_q` | `spawn` | `SHCMD("killall bar.sh chadwm")` |
| `MODKEY` | `XK_q` | `killclient` | `{0}` |
| `MODKEY\|ShiftMask` | `XK_r` | `restart` | `{0}` |
| `MODKEY` | `XK_e` | `hidewin` | `{0}` |
| `MODKEY\|ShiftMask` | `XK_e` | `restorewin` | `{0}` |
| `MODKEY` | `XK_1` | `view` | `{.ui = 1 << 0}` |
| `MODKEY\|ControlMask` | `XK_1` | `toggleview` | `{.ui = 1 << 0}` |
| `MODKEY\|ShiftMask` | `XK_1` | `tag` | `{.ui = 1 << 0}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_1` | `toggletag` | `{.ui = 1 << 0}` |
| `MODKEY` | `XK_2` | `view` | `{.ui = 1 << 1}` |
| `MODKEY\|ControlMask` | `XK_2` | `toggleview` | `{.ui = 1 << 1}` |
| `MODKEY\|ShiftMask` | `XK_2` | `tag` | `{.ui = 1 << 1}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_2` | `toggletag` | `{.ui = 1 << 1}` |
| `MODKEY` | `XK_3` | `view` | `{.ui = 1 << 2}` |
| `MODKEY\|ControlMask` | `XK_3` | `toggleview` | `{.ui = 1 << 2}` |
| `MODKEY\|ShiftMask` | `XK_3` | `tag` | `{.ui = 1 << 2}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_3` | `toggletag` | `{.ui = 1 << 2}` |
| `MODKEY` | `XK_4` | `view` | `{.ui = 1 << 3}` |
| `MODKEY\|ControlMask` | `XK_4` | `toggleview` | `{.ui = 1 << 3}` |
| `MODKEY\|ShiftMask` | `XK_4` | `tag` | `{.ui = 1 << 3}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_4` | `toggletag` | `{.ui = 1 << 3}` |
| `MODKEY` | `XK_5` | `view` | `{.ui = 1 << 4}` |
| `MODKEY\|ControlMask` | `XK_5` | `toggleview` | `{.ui = 1 << 4}` |
| `MODKEY\|ShiftMask` | `XK_5` | `tag` | `{.ui = 1 << 4}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_5` | `toggletag` | `{.ui = 1 << 4}` |
| `MODKEY` | `XK_6` | `view` | `{.ui = 1 << 5}` |
| `MODKEY\|ControlMask` | `XK_6` | `toggleview` | `{.ui = 1 << 5}` |
| `MODKEY\|ShiftMask` | `XK_6` | `tag` | `{.ui = 1 << 5}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_6` | `toggletag` | `{.ui = 1 << 5}` |
| `MODKEY` | `XK_7` | `view` | `{.ui = 1 << 6}` |
| `MODKEY\|ControlMask` | `XK_7` | `toggleview` | `{.ui = 1 << 6}` |
| `MODKEY\|ShiftMask` | `XK_7` | `tag` | `{.ui = 1 << 6}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_7` | `toggletag` | `{.ui = 1 << 6}` |
| `MODKEY` | `XK_8` | `view` | `{.ui = 1 << 7}` |
| `MODKEY\|ControlMask` | `XK_8` | `toggleview` | `{.ui = 1 << 7}` |
| `MODKEY\|ShiftMask` | `XK_8` | `tag` | `{.ui = 1 << 7}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_8` | `toggletag` | `{.ui = 1 << 7}` |
| `MODKEY` | `XK_9` | `view` | `{.ui = 1 << 8}` |
| `MODKEY\|ControlMask` | `XK_9` | `toggleview` | `{.ui = 1 << 8}` |
| `MODKEY\|ShiftMask` | `XK_9` | `tag` | `{.ui = 1 << 8}` |
| `MODKEY\|ControlMask\|ShiftMask` | `XK_9` | `toggletag` | `{.ui = 1 << 8}` |

## Button Bindings

| Clic | Mask | Bouton | Fonction | Argument |
|------|------|--------|----------|----------|
| `ClkLtSymbol` | `0` | `Button1` | `setlayout` | `{0}` |
| `ClkLtSymbol` | `0` | `Button3` | `setlayout` | `{.v = &layouts[2]}` |
| `ClkWinTitle` | `0` | `Button2` | `zoom` | `{0}` |
| `ClkStatusText` | `0` | `Button2` | `spawn` | `{.v = terminal}` |
| `ClkClientWin` | `MODKEY` | `Button1` | `moveorplace` | `{.i = 0}` |
| `ClkClientWin` | `MODKEY` | `Button2` | `togglefloating` | `{0}` |
| `ClkClientWin` | `MODKEY` | `Button3` | `resizemouse` | `{0}` |
| `ClkClientWin` | `ControlMask` | `Button1` | `dragmfact` | `{0}` |
| `ClkClientWin` | `ControlMask` | `Button3` | `dragcfact` | `{0}` |
| `ClkTagBar` | `0` | `Button1` | `view` | `{0}` |
| `ClkTagBar` | `0` | `Button3` | `toggleview` | `{0}` |
| `ClkTagBar` | `MODKEY` | `Button1` | `tag` | `{0}` |
| `ClkTagBar` | `MODKEY` | `Button3` | `toggletag` | `{0}` |
| `ClkTabBar` | `0` | `Button1` | `focuswin` | `{0}` |
| `ClkTabBar` | `0` | `Button1` | `focuswin` | `{0}` |
| `ClkTabPrev` | `0` | `Button1` | `movestack` | `{ .i = -1 }` |
| `ClkTabNext` | `0` | `Button1` | `movestack` | `{ .i = +1 }` |
| `ClkTabClose` | `0` | `Button1` | `killclient` | `{0}` |


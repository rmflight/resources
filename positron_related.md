## targets & tflow related keybindings

```{json}
{
"key": "Ctrl+T M",
"command": "workbench.action.executeCode.console",
"args": {
"langId": "r",
"code": "targets::tar_make()",
"focus": false
}
},
{
"key": "Ctrl+T T",
"command": "workbench.action.executeCode.console",
"args": {
"langId": "r",
"code": "tflow::rs_make_target_at_cursor()",
"focus": false
}
},
{
"key": "Ctrl+T R",
"command": "workbench.action.executeCode.console",
"args": {
"langId": "r",
"code": "targets::rstudio_addin_tar_read()",
"focus": false
}
},
{
"key": "Ctrl+T L",
"command": "workbench.action.executeCode.console",
"args": {
"langId": "r",
"code": "targets::rstudio_addin_tar_load()",
"focus": false
}
}
```

import sys
import os
import datetime
import subprocess

from keyhac import *


def configure(keymap):

    # --------------------------------------------------------------------
    # Text editer setting for editting config.py file

    # Setting with program file path (Simple usage)
    if 1:
        keymap.editor = "MacVim"

    # Setting with callable object (Advanced usage)
    if 0:
        def editor(path):
            subprocess.call([ "open", "-a", "TextEdit", path ])
        keymap.editor = editor


    # --------------------------------------------------------------------
    # Customizing the display

    # Font
    keymap.setFont( "Osaka-Mono", 16 )

    # Theme
    keymap.setTheme("black")


    # --------------------------------------------------------------------
    # Key replacement and modifier key definition

    # Replacing Right-Alt key with Right-Control
    #keymap.replaceKey("RAlt", "RCtrl")

    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # OS の設定で CapsLock <-> Ctrl にする
    #keymap.replaceKey("CapsLock",    "LCtrl")
    keymap.replaceKey("Enter",   "RCtrl")
    # 日本語入力の確定のためにグローバルで Ctrl-M を Return に置き換える
    keymap_global["Ctrl-M"] = "Return"

    # Moving active window by keyboard
    if 1:
        # Ctrl-Alt-Up/Down/Left/Right : Move active window by 10 pixel unit
        keymap_global[ "Ctrl-Alt-Left"  ] = keymap.MoveWindowCommand( -10, 0 )
        keymap_global[ "Ctrl-Alt-Right" ] = keymap.MoveWindowCommand( +10, 0 )
        keymap_global[ "Ctrl-Alt-Up"    ] = keymap.MoveWindowCommand( 0, -10 )
        keymap_global[ "Ctrl-Alt-Down"  ] = keymap.MoveWindowCommand( 0, +10 )

        # Ctrl-Alt-Shift-Up/Down/Left/Right : Move active window by 1 pixel unit
        keymap_global[ "Ctrl-Alt-Shift-Left"  ] = keymap.MoveWindowCommand( -1, 0 )
        keymap_global[ "Ctrl-Alt-Shift-Right" ] = keymap.MoveWindowCommand( +1, 0 )
        keymap_global[ "Ctrl-Alt-Shift-Up"    ] = keymap.MoveWindowCommand( 0, -1 )
        keymap_global[ "Ctrl-Alt-Shift-Down"  ] = keymap.MoveWindowCommand( 0, +1 )

        # Ctrl-Alt-Cmd-Up/Down/Left/Right : Move active window to screen edges
        keymap_global[ "Ctrl-Alt-Cmd-Left"  ] = keymap.MoveWindowToMonitorEdgeCommand(0)
        keymap_global[ "Ctrl-Alt-Cmd-Right" ] = keymap.MoveWindowToMonitorEdgeCommand(2)
        keymap_global[ "Ctrl-Alt-Cmd-Up"    ] = keymap.MoveWindowToMonitorEdgeCommand(1)
        keymap_global[ "Ctrl-Alt-Cmd-Down"  ] = keymap.MoveWindowToMonitorEdgeCommand(3)


    # IME switching (one-shot)
    keymap_global["O-LCmd"] = "102" # eisuu
    keymap_global["O-RCmd"] = "104" # kana

    # shell like mode
    shell_keybinds = {
            "Ctrl-P"          : "Up",
            "Ctrl-N"          : "Down",
            "Ctrl-F"          : "Right",
            "Ctrl-B"          : "Left",
            "Ctrl-A"          : "Cmd-Left",
            "Ctrl-E"          : "Cmd-Right",
            "Ctrl-D"          : "Delete",
            "Ctrl-H"          : "Back",
            "Ctrl-I"          : "Tab",
            "Ctrl-OpenBracket": "Esc",
            "Ctrl-U"          : ("Cmd-Shift-Left", "Delete"),
            "Ctrl-W"          : ("Alt-Shift-Left", "Delete"),
            "Ctrl-J"          : "Return",
            "Ctrl-M"          : "Return"
    }
    shell_keybinds_ignore_apps = [
            "org.vim.MacVim",
            "com.googlecode.iterm2",
            "com.apple.dt.Xcode"
    ]
    for k, v in shell_keybinds.items():
        keymap_global[k] = v
    for app in shell_keybinds_ignore_apps:
        keymap_ignore_app = keymap.defineWindowKeymap(app_name=app)
        for key in shell_keybinds.keys():
            keymap_ignore_app[key] = key

    # Keyboard macro
    if 1:
        keymap_global[ "Fn-0" ] = keymap.command_RecordToggle
        keymap_global[ "Fn-1" ] = keymap.command_RecordStart
        keymap_global[ "Fn-2" ] = keymap.command_RecordStop
        keymap_global[ "Fn-3" ] = keymap.command_RecordPlay
        keymap_global[ "Fn-4" ] = keymap.command_RecordClear


    # Activation of specific window
    if 1:
        # Fn-T : Activate Terminal
        keymap_global[ "Fn-T" ] = keymap.ActivateApplicationCommand( "com.apple.Terminal" )


    # --------------------------------------------------------------------
    # Clipboard related customization
    if 1:
        keymap_global[ "Fn-Z"       ] = keymap.command_ClipboardList      # Open the clipboard history list
        keymap_global[ "Fn-X"       ] = keymap.command_ClipboardRotate    # Move the most recent history to tail
        keymap_global[ "Fn-Shift-X" ] = keymap.command_ClipboardRemove    # Remove the most recent history
        keymap.quote_mark = "> "                                          # Mark for quote pasting

        # Maximum number of clipboard history (Default:1000)
        keymap.clipboard_history.maxnum = 1000

        # Total maximum size of clipboard history (Default:10MB)
        keymap.clipboard_history.quota = 10*1024*1024

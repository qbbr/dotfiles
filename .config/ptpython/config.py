"""
Configuration example for ``ptpython``.

Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
On Linux, this is: ~/.config/ptpython/config.py
"""
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys
from prompt_toolkit.styles import Style

from ptpython.layout import CompletionVisualisation

__all__ = ["configure"]


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    # Show function signature (bool).
    repl.show_signature = True

    # Show docstring (bool).
    repl.show_docstring = False

    # Show the "[Meta+Enter] Execute" message when pressing [Enter] only
    # inserts a newline instead of executing the code.
    repl.show_meta_enter_message = True

    # Show completions. (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    repl.completion_visualisation = CompletionVisualisation.POP_UP

    # When CompletionVisualisation.POP_UP has been chosen, use this
    # scroll_offset in the completion menu.
    repl.completion_menu_scroll_offset = 0

    # Show line numbers (when the input contains multiple lines.)
    repl.show_line_numbers = False

    # Show status bar.
    repl.show_status_bar = True

    # When the sidebar is visible, also show the help text.
    repl.show_sidebar_help = True

    # Swap light/dark colors on or off
    repl.swap_light_and_dark = False

    # Highlight matching parethesis.
    repl.highlight_matching_parenthesis = True

    # Line wrapping. (Instead of horizontal scrolling.)
    repl.wrap_lines = True

    # Mouse support.
    repl.enable_mouse_support = True

    # Complete while typing. (Don't require tab before the
    # completion menu is shown.)
    repl.complete_while_typing = True

    # Fuzzy and dictionary completion.
    repl.enable_fuzzy_completion = False
    repl.enable_dictionary_completion = False

    # Vi mode.
    repl.vi_mode = True

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = "classic"  # 'classic' or 'ipython'

    # Don't insert a blank line after the output.
    repl.insert_blank_line_after_output = False

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable auto suggestions. (Pressing right arrow will complete the input,
    # based on the history.)
    repl.enable_auto_suggest = False

    # Enable open-in-editor. Pressing C-x C-e in emacs mode or 'v' in
    # Vi navigation mode will open the input in the current editor.
    repl.enable_open_in_editor = True

    # Enable system prompt. Pressing meta-! will display the system prompt.
    # Also enables Control-Z suspend.
    repl.enable_system_bindings = True

    # Ask for confirmation on exit.
    repl.confirm_exit = True

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Use this colorscheme for the code.
    # Ptpython uses Pygments for code styling, so you can choose from Pygments'
    # color schemes. See:
    # https://pygments.org/docs/styles/
    # https://pygments.org/demo/
    repl.use_code_colorscheme("solarizeddark")
    # A colorscheme that looks good on dark backgrounds is 'native':
    # repl.use_code_colorscheme("native")

    # Set color depth (keep in mind that not all terminals support true color).

    # repl.color_depth = "DEPTH_1_BIT"  # Monochrome.
    # repl.color_depth = "DEPTH_4_BIT"  # ANSI colors only.
    # repl.color_depth = "DEPTH_8_BIT"  # The default, 256 colors.
    repl.color_depth = "DEPTH_24_BIT"  # True color.

    # Min/max brightness
    repl.min_brightness = 0.0  # Increase for dark terminal backgrounds.
    repl.max_brightness = 1.0  # Decrease for light terminal backgrounds.

    # Syntax.
    repl.enable_syntax_highlighting = True

    # Get into Vi navigation mode at startup
    repl.vi_start_in_navigation_mode = False

    # Preserve last used Vi input mode between main loop iterations
    repl.vi_keep_last_used_mode = False

    # Install custom colorscheme named 'my-colorscheme' and use it.
    repl.install_ui_colorscheme("my-colorscheme", Style.from_dict(_custom_ui_colorscheme))
    repl.use_ui_colorscheme("my-colorscheme")

    # Add custom key binding for PDB.
    """
    @repl.add_key_binding("c-b")
    def _(event):
        " Pressing Control-B will insert "pdb.set_trace()" "
        event.cli.current_buffer.insert_text("\nimport pdb; pdb.set_trace()\n")
    """

    # Typing ControlE twice should also execute the current command.
    # (Alternative for Meta-Enter.)
    """
    @repl.add_key_binding("c-e", "c-e")
    def _(event):
        event.current_buffer.validate_and_handle()
    """

    # Typing 'jj' in Vi Insert mode, should send escape. (Go back to navigation
    # mode.)
    """
    @repl.add_key_binding("j", "j", filter=ViInsertMode())
    def _(event):
        " Map 'jj' to Escape. "
        event.cli.key_processor.feed(KeyPress(Keys("escape")))
    """

    # Custom key binding for some simple autocorrection while typing.
    """
    corrections = {
        "impotr": "import",
        "pritn": "print",
    }

    @repl.add_key_binding(" ")
    def _(event):
        " When a space is pressed. Check & correct word before cursor. "
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()

        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])

        b.insert_text(" ")
    """

    # Add a custom title to the status bar. This is useful when ptpython is
    # embedded in other applications.
    """
    repl.title = "My custom prompt."
    """


# Custom colorscheme for the UI. See `ptpython/layout.py` and
# `ptpython/style.py` for all possible tokens.
_custom_ui_colorscheme = {
    # "control-character": "ansiblue",
    # # Classic prompt.
    # "prompt": "bold",
    # "prompt.dots": "noinherit",
    # # (IPython <5.0) Prompt: "In [1]:"
    # "in": "bold #008800",
    # "in.number": "",
    # # Return value.
    # "out": "#ff0000",
    # "out.number": "#ff0000",
    # # Completions.
    # "completion.builtin": "",
    # "completion.param": "#006666 italic",
    # "completion.keyword": "fg:#008800",
    # "completion.keyword fuzzymatch.inside": "fg:#008800",
    # "completion.keyword fuzzymatch.outside": "fg:#44aa44",
    # # Separator between windows. (Used above docstring.)
    # "separator": "#bbbbbb",
    # # System toolbar
    # "system-toolbar": "#22aaaa noinherit",
    # # "arg" toolbar.
    # "arg-toolbar": "#22aaaa noinherit",
    # "arg-toolbar.text": "noinherit",
    # # Signature toolbar.
    # "signature-toolbar": "bg:#44bbbb #000000",
    # "signature-toolbar current-name": "bg:#008888 #ffffff bold",
    # "signature-toolbar operator": "#000000 bold",
    # "docstring": "#888888",
    # # Validation toolbar.
    # "validation-toolbar": "bg:#440000 #aaaaaa",
    # Status toolbar.
    "status-toolbar": "bg:#93A1A1 #073642",
    # "status-toolbar.title": "underline",
    # "status-toolbar.inputmode": "bg:#222222 #ffffaa",
    "status-toolbar.key": "bg:#268BD2 #eee8d5",
    # "status-toolbar key": "bg:#000000 #888888",
    # "status-toolbar.pastemodeon": "bg:#aa4444 #ffffff",
    # "status-toolbar.pythonversion": "bg:#222222 #ffffff bold",
    # "status-toolbar paste-mode-on": "bg:#aa4444 #ffffff",
    # "record": "bg:#884444 white",
    "status-toolbar more": "#268BD2",
    "status-toolbar.input-mode": "#002B36",
    # # The options sidebar.
    "sidebar": "bg:#93a1a1 #002b36",
    "sidebar.title": "bg:#268BD2 #eee8d5",
    # "sidebar.label": "bg:#bbbbbb #222222",
    # "sidebar.status": "bg:#dddddd #000011",
    # "sidebar.label selected": "bg:#222222 #eeeeee",
    # "sidebar.status selected": "bg:#444444 #ffffff bold",
    # "sidebar.separator": "underline",
    # "sidebar.key": "bg:#bbddbb #000000 bold",
    # "sidebar.key.description": "bg:#bbbbbb #000000",
    # "sidebar.helptext": "bg:#fdf6e3 #000011",
    # #        # Styling for the history layout.
    # #        history.line:                          '',
    # #        history.line.selected:                 'bg:#008800  #000000',
    # #        history.line.current:                  'bg:#ffffff #000000',
    # #        history.line.selected.current:         'bg:#88ff88 #000000',
    # #        history.existinginput:                  '#888888',
    # # Help Window.
    # "window-border": "#aaaaaa",
    # "window-title": "bg:#bbbbbb #000000",
    # # Meta-enter message.
    # "accept-message": "bg:#ffff88 #444444",
    # # Exit confirmation.
    "exit-confirmation": "bg:#93a1a1 #002b36",
}

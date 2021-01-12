# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# umpv suerscript
config.bind('<Ctrl-Shift-m>','hint links spawn ~/.config/qutebrowser/scripts/umpv {hint-url}')

# qute-pass userscript
config.bind('<Ctrl-Shift-p>','spawn --userscript qute-pass -d "/usr/local/bin/dmenu -c -l 20"')

# Searchengines
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}", "aw": "https://wiki.archlinux.org/?search={}", "yt": "https://youtube.com/results?search_query={}", "aur": "https://aur.archlinux.org/packages/?O=0&K={}", "gh": "https://github.com/search?q={}"}
c.url.open_base_url = True

# Removes downloads from view after 5 seconds
c.downloads.remove_finished = 5000

# Can open downloads using rifle
c.downloads.open_dispatcher = "rifle"

# Opens new instances of links in a new window (mostly for neomutt)
c.new_instance_open_target = "window"

# Activates spellcheck of US english
c.spellcheck.languages = ["en-US"]

# Configuring tabs
c.tabs.show = "multiple"
c.tabs.background = True


#######################################################################################################
###### Colorscheme - partially stolen from https://github.com/KnownAsDon/QuteBrowser-Nord-Theme #######
#######################################################################################################

custom = {
    'base03': '#3b4252',
    'base02': '#434c5e',
    'base01': '#e5e9f0',
    'base00': '#d8dee9',
    'base0': '#4c566a',
    'base1': '#5e81ac',
    'base2': '#eee8d5',
    'base3': '#eceff4',
    'yellow': '#ebcb8b',
    'orange': '#ebcb8b',
    'red': '#bf616a',
    'magenta': '#b48ead',
    'violet': '#9900cc',
    'blue': '#5e81ac',
    'cyan': '#88c0d0',
    'green': '#a3be8c'
}

## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = custom['base03']

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = custom['base03']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = custom['base03']

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = custom['base3']

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = custom['base02']

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = custom['base3']

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = custom['violet']

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = custom['violet']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = custom['violet']

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = custom['base3']

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = custom['base2']

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = custom['base02']

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = custom['base0']

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = custom['base2']

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = custom['base03']

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = custom['red']

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = custom['base3']

## Color gradient start for download backgrounds.
## Type: QtColor
# c.colors.downloads.start.bg = '#0000aa'

## Color gradient start for download text.
## Type: QtColor
c.colors.downloads.start.fg = custom['base3']

## Color gradient stop for download backgrounds.
## Type: QtColor
# c.colors.downloads.stop.bg = '#00aa00'

## Color gradient end for download text.
## Type: QtColor
# c.colors.downloads.stop.fg = custom['base3']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'

## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = custom['violet']

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = custom['base3']

## Font color for the matched part of hints.
## Type: QssColor
c.colors.hints.match.fg = custom['base2']

## Background color of the keyhint widget.
## Type: QssColor
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = custom['base3']

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = custom['yellow']

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = custom['red']

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = custom['red']

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = custom['base3']

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = custom['base03']

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = custom['base03']

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = custom['base3']

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = custom['orange']

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = custom['orange']

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = custom['base3']

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = custom['base02']

## Border used around UI elements in prompts.
## Type: String
c.colors.prompts.border = '1px solid ' + custom['base3']

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = custom['base3']

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = custom['base01']

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = custom['blue']

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = custom['base3']

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = custom['violet']

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = custom['base3']

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = custom['base03']

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = custom['base3']

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = custom['base01']

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = custom['base3']

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = custom['green']

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = custom['base3']

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = custom['base03']

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = custom['base3']

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = custom['magenta']

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = custom['base3']

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = custom['base01']

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = custom['base3']

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = custom['base3']

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = custom['red']

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = custom['base3']

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = custom['base2']

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = custom['base3']

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = custom['base3']

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = custom['yellow']

## Background color of the tab bar.
## Type: QtColor
# c.colors.tabs.bar.bg = '#555555'

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = custom['base01']

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = custom['base03']

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = custom['red']

## Color gradient start for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.start = custom['violet']

## Color gradient end for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.stop = custom['orange']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.tabs.indicator.system = 'rgb'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = custom['base01']

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = custom['base03']

## Background color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.bg = custom['base03']

## Foreground color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.fg = custom['base3']

## Background color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.bg = custom['base03']

## Foreground color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.fg = custom['base3']

## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'

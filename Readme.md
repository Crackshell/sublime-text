# Crackshell package for Sublime Text
This package includes several Sublime Text syntaxes for multiple parts of Crackshell's game engine.

1. Complete replacement for the [AngelScript](https://github.com/wronex/sublime-angelscript) syntax, providing a more complete and somewhat context-aware syntax highlighting, specifically suited to fit some of the engine's API.
2. Syntax for `.sval` files. This builds upon the standards of XML, but highlights specific keywords such as `dict`, `array`, `string`, etc. Also specifically highlights strings named `class`, and applies a namespace/class scope to its value.
3. Syntax for `.unit` files. It's also based on XML, and is somewhat context-aware. Behaviors embed the SValue syntax, and attributes are contextually highlighted.

## How to install
The easiest way to install this package is through [Package Control](https://packagecontrol.io/). In Sublime Text, simply press `Ctrl+Shift+P`, navigate to "Install package", and find the package named "Crackshell".

Manual install is done by making a folder in your packages folder. On Windows for example, you clone the repository here: `C:\Users\Username\AppData\Roaming\Sublime Text 3\Packages\Crackshell\`

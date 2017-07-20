" Vim syntax file
" Language: Glyph
" Last Change: 2011-02-20
" Author: Fabio Cevasco <h3rald@h3rald.com>
" Version: 1.5.0
" Limitations:
" - Attributes are not highlighted in Quoting Macros
" - Parameter/attribute placeholders are highlighted in all macros

if exists("b:current_syntax")
  finish
endif

syntax keyword glyphMacroName bpfucker 

" Highlighting
highlight link glyphMacroName Function

let b:current_syntax = "glyph"

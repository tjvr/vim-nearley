if exists('b:current_syntax')
  let old_syntax = b:current_syntax
  unlet b:current_syntax
endif

if search('^@preprocessor typescript') != 0
  syn include @typescript syntax/typescript.vim
  unlet b:current_syntax

  let code_language = "typescript"
else
  syn include @javascript syntax/javascript.vim
  unlet b:current_syntax

  let code_language = "javascript"
endif

syn match nearleyInclude    "^@include"
syn match nearleyDirective  "^@builtin"
syn match nearleyDirective  "^@preprocessor"
syn match nearleyDirective  "^@lexer"
syn match nearleyComment    "#.*"

syn match nearleyNonTerminal "\(^@.*\)\@<![a-zA-Z0-9_?+]\+" nextgroup=nearleyMacroArgs
syn match nearleyNonTerminal "^[a-zA-Z0-9_?+]\+" nextgroup=nearleyMacroParams
syn match nearleyToken "%[a-zA-Z0-9_?+]\+"
syn match nearleyMixin "$[a-zA-Z0-9_?+]\+"

syn match nearleyOperator "("
syn match nearleyOperator ")"
syn match nearleyOperator "->"
syn match nearleyOperator "=>"
syn match nearleyOperator "|"
syn match nearleyOperator ","
syn match nearleyOperator ":+"
syn match nearleyOperator ":\*"
syn match nearleyOperator ":?"

syn match nearleyStringFlag "i" contained
syn region nearleyString start=+"+ skip="\\." end=+"+ nextgroup=nearleyStringFlag
syn region nearleyString start="`" skip="\\." end="`" nextgroup=nearleyStringFlag
syn region nearleyString start="\[" end="\]"

syn match nearleyMacroParam "[a-zA-Z0-9_?+]\+" contained
syn region nearleyMacroArgs matchgroup=nearleyOperator start="\[" end="\]" contained contains=TOP
syn region nearleyMacroParams matchgroup=nearleyOperator start="\[" end="\]" contained contains=nearleyMacroParam,nearleyOperator

hi def link nearleyStringFlag   nearleyOperator
hi def link nearleyMacroParam   nearleyMixin

if code_language == "typescript"
  syn region nearleyCodeBlock matchgroup=nealeyCodeQuote start=+@{%+ end=+%}+ contains=@typescript fold
  syn region nearleyCodeBlockPost matchgroup=nealeyCodeQuote start=+{%+ end=+%}+ contains=@typescript fold
else
  syn region nearleyCodeBlock matchgroup=nealeyCodeQuote start=+@{%+ end=+%}+ contains=@javascript fold
  syn region nearleyCodeBlockPost matchgroup=nealeyCodeQuote start=+{%+ end=+%}+ contains=@javascript fold
endif

syn keyword nearleyBuiltin id joiner arrconcat nuller containedin=nearleyCodeBlockPost

hi def link nearleyInclude      Include
hi def link nearleyDirective    Macro
hi def link nearleyComment      Comment
hi def link nearleyOperator     Operator
hi def link nearleyBuiltin      Keyword
hi def link nearleyString       String
hi def link nearleyNonTerminal  Identifier
hi def link nearleyToken        Constant
hi def link nearleyMixin        PreProc
hi def link nealeyCodeQuote     Operator

if exists('old_syntax')
  let b:current_syntax = old_syntax
endif

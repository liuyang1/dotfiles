" call SyntaxRange#Include('{{{', '}}}', 'sh', 'SpecialComment')
" call SyntaxRange#Include('{{{class=\"brush: c\"', '}}}', 'c', 'SpecialComment')
" call SyntaxRange#Include('{{{class=\"brush: python\"', '}}}', 'python', 'SpecialComment')
syn match texGreek '^#\>' contained conceal cchar=o
syn match texGreek '^*\>' contained conceal cchar=o

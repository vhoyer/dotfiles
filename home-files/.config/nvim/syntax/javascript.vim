syntax match jsDocAnnotation /@params/ containedin=jsComment
syntax region jsDocAnnotationType start=/\(@params\s\+\)\@<={/ end=/}/ containedin=jsComment
syntax region jsDocAnnotationIdentifier start=/\(@params\s{[^}]*}\s\)\@<=/ end=/\s/me=s-1 containedin=jsComment

highlight link jsDocAnnotation Statement
highlight link jsDocAnnotationType Type
highlight link jsDocAnnotationIdentifier Identifier

highlight link Operator GruvboxYellow
highlight link jsOperatorKeyword Keyword
highlight link jsGlobalObjects GruvboxYellow

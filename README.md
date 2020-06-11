# Basic cipher in ruby

Some basic scripts in ruby.

## Caesar cipher

*	https://en.wikipedia.org/wiki/Caesar_cipher

How to call it :
`
ruby caesar_cypher.rb "5" "My text to encrypt" "m y a l p h a b e t" (optional)
`

We need 2 arguments : 

* Shift number (from 1 to the length of original alphabet)
* The text to convert (if a character is not in the original alphabet, it will return the original character)
* (optional) Original alphabet to convert (it has to be separate with space and an expression has to be only 1 letter => to improve)

## Substitution cipher

*	https://en.wikipedia.org/wiki/Substitution_cipher

How to call it :
`
ruby caesar_cypher.rb "ornithorynque" "My text to encrypt" "m y a l p h a b e t" (optional)
`

We need 2 arguments : 

* Substitution word (all characters should be in latin alphabet or custom alphabet)
* The text to convert (if a character is not in the original alphabet, it will return the original character)
* (optional) Original alphabet to convert (it has to be separate with space and an expression has to be only 1 letter => to improve)

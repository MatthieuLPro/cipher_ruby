# frozen_string_literal: true

require_relative 'cipher_core'

ALPHABET        = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
shift_nb        = ARGV[0].to_i
text_to_convert = ARGV[1]
old_alphabet    = ARGV[2] ? ARGV[2].split(' ') : ALPHABET

abort('We need at least 2 arguments : 1) shift number 2) text to convert') if ARGV.length < 2
abort('Argument 0 is not a number or has to be between 1 and 25') if shift_nb_is_valide?(shift_nb)

def shift_nb_is_valide?(shift_nb)
  shift_nb <= 0 || shift_nb >= 26
end

def generate_new_alphabet(current_alphabet, shift_nb)
  new_alphabet = Hash[current_alphabet.product([nil])]
  current_alphabet.each do |letter|
    new_alphabet[letter] = current_alphabet[generate_new_letter(current_alphabet, letter, shift_nb)]
  end
  new_alphabet
end

def generate_new_letter(current_alphabet, letter, shift_nb)
  new_nb_index = current_alphabet.find_index(letter) + shift_nb
  (new_nb_index -= current_alphabet.length) if new_nb_index > current_alphabet.length - 1
  new_nb_index
end

new_alphabet = generate_new_alphabet(old_alphabet, shift_nb)

puts 'new_text: ' + convert_text(new_alphabet, text_to_convert)

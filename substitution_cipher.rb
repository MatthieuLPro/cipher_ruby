# frozen_string_literal: true
require_relative 'cipher_core'

ALPHABET        = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
sub_word        = ARGV[0]
text_to_convert = ARGV[1]
old_alphabet    = ARGV[2] ? ARGV[2].split(' ') : ALPHABET

def sub_word_is_valide?(current_alphabet, sub_word)
  sub_word.split('').each do |letter|
    return false unless current_alphabet.find_index(letter)
  end
  true
end

abort('We need at least 2 arguments : 1) substitution word 2) text to convert') if ARGV.length < 2
abort('Argument 0 has unvalid character, all characters should be in latin alphabet or custom alphabet') unless sub_word_is_valide?(old_alphabet, sub_word)

def sub_word_generate(sub_word)
  new_sub_word = []
  sub_word.split('').each do |letter|
    new_sub_word << letter unless new_sub_word.find_index(letter)
  end
  new_sub_word
end

def generate_new_alphabet(current_alphabet, sub_word)
  new_sub_word = sub_word_generate(sub_word)
  new_alphabet = generate_alphabet_from_word(current_alphabet, new_sub_word)
  generate_alphabet_from_old_alphabet(current_alphabet, new_alphabet, new_sub_word)
end

def generate_alphabet_from_word(current_alphabet, sub_word)
  new_alphabet = Hash[current_alphabet.product([nil])]
  current_alphabet.each_with_index do |letter, ind|
    break unless sub_word[ind]

    new_alphabet[letter] = sub_word[ind]
  end
  new_alphabet
end

def generate_alphabet_from_old_alphabet(current_alphabet, new_alphabet, sub_word)
  i = 0
  new_alphabet.each_with_index do |letter, ind|
    next unless letter[1].nil?

    while sub_word.find_index(current_alphabet[i])
      i += 1
    end

    new_alphabet[letter[0]] = current_alphabet[i]
    i += 1
  end
  new_alphabet
end

new_alphabet = generate_new_alphabet(old_alphabet, sub_word)

puts 'new_text: ' + convert_text(new_alphabet, text_to_convert)

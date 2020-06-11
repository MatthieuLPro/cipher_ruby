# frozen_string_literal: true

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

# frozen_string_literal: true

def convert_text(new_alphabet, old_text)
  new_text = ''

  # changer la methode du old_text => besoin de generer un array avec les conditions suivantes :
  # On parcourt la string jusqu'a trouver une expression existante dans le old_alphabet
  # Les separateurs deviennent comme suit => une expression N'EXISTANT PAS dans le old_alphabet devient ders lors un separateur
  # Cette modification est necessaire pour utiliser des alphabets avec des expressions de plus de 1 character
  old_text.split('').each do |letter|
    new_text += if new_alphabet[letter].nil?
                  letter
                else
                  new_alphabet[letter]
                end
  end
  new_text
end

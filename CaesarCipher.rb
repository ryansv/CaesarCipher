class CaesarCipher
  ALPHABET = ('a'..'z').to_a
  
  def initialize(number_to_shift)
    @encyption_hash = Hash[ALPHABET.zip ALPHABET.rotate(number_to_shift)]
    @decryption_hash = Hash[ALPHABET.zip ALPHABET.rotate(-number_to_shift)]
  end
  
  def encrypt(word)
    new_word = ""
    for letter in word.chars
      lowercase_letter = letter.downcase
      is_lowercase = letter == lowercase_letter
      encrypted_letter = @encyption_hash[lowercase_letter]
      
      if !encrypted_letter then
        new_word += letter
      else
        if is_lowercase then 
          new_word += encrypted_letter
        else
          new_word += encrypted_letter.upcase
        end
      end
      
    end
    return new_word
  end
  
end

puts "Enter phrase to encrypt: "
word = gets.chomp
puts "Enter number of letters to shift: "
shift = gets.chomp

begin
  shift = Integer(shift)
rescue ArgumentError
  abort "Invalid value for number of letters to shift: \""+shift+"\", it must be an integer."
end

cipher = CaesarCipher.new(shift)
puts "The phrase: " + word + " is encrypted to: " + cipher.encrypt(word)
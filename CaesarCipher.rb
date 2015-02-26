class CaesarCipher
  ALPHABET = ('a'..'z').to_a
  
  def initialize(number_to_shift)
    @encryption_hash = Hash[ALPHABET.zip ALPHABET.rotate(number_to_shift)]
    @decryption_hash = Hash[ALPHABET.zip ALPHABET.rotate(-number_to_shift)]
  end
  
  def encrypt(word)
    do_encryption(word, :encrypt)
  end
	
	def decrypt(word)
    do_encryption(word, :decrypt)
  end
  
	private
	
	def do_encryption(word, method)
		new_word = ""
    for letter in word.chars
      lowercase_letter = letter.downcase
      is_lowercase = letter == lowercase_letter
			
			if method == :encrypt then
				encrypted_letter = @encryption_hash[lowercase_letter]
      elsif method == :decrypt then
				encrypted_letter = @decryption_hash[lowercase_letter]
      end
			
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
encrypted_word = cipher.encrypt(word)
decrypted_word = cipher.decrypt(encrypted_word)
puts "The phrase: " + word + " is encrypted to: " + encrypted_word
puts "Decrypting: " + encrypted_word + " gives the original word: " + decrypted_word
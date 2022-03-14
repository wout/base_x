module Base58::Int
  extend self

  # Converts a base58 string to a base10 integer.
  def self.decode(
    str : String,
    alphabet = DEFAULT
  ) : Number
    str.reverse.chars.map_with_index do |char, index|
      unless char_index = alphabet.index(char)
        raise DecodingError.new("Value passed not a valid Base58 String")
      end

      char_index.to_big_i * (BASE.to_big_i ** index.to_big_i)
    end.sum
  end

  # Converts a base10 integer to a base58 string.
  def self.encode(
    int : Number,
    alphabet = DEFAULT
  ) : String
    String.build do |str|
      while int >= BASE
        mod = int % BASE
        str << alphabet[mod.to_big_i, 1]
        int = (int - mod).divmod(BASE).first
      end
      str << alphabet[int.to_big_i, 1]
    end.reverse
  end
end

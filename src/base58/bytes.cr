module Base58::Bytes
  extend self

  # Converts a base58 string to bytes.
  def self.decode(
    str : String,
    alphabet = DEFAULT
  ) : ::Bytes
    zeroes = str.chars.index { |c| c != alphabet[0] } || str.size - 1

    String.build do |io|
      zeroes.times { io << "00" } if zeroes.positive?
      hex = Int.decode(str, alphabet).to_s(16)
      io << '0' if hex.size.odd?
      io << hex
    end.hexbytes
  end

  # Converts bytes to a base58 string.
  def self.encode(
    bytes : ::Bytes,
    alphabet = DEFAULT,
    leading_zeroes = true
  ) : String
    return Int.encode(0, alphabet) if bytes.empty?

    String.build do |io|
      if leading_zeroes
        (bytes.index(&.positive?) || bytes.size - 1).times { io << alphabet[0] }
      end

      io << Int.encode(bytes.hexstring.to_big_i(16), alphabet)
    end
  end
end

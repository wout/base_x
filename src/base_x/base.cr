module BaseX
  extend self

  # Converts bytes to a base-x string.
  def encode(
    bytes : Bytes,
    alphabet : String,
    leading_zeroes = true,
    base = alphabet.size
  ) : String
    return encode(0, alphabet) if bytes.empty?

    String.build do |io|
      if leading_zeroes
        (bytes.index(&.positive?) || bytes.size - 1)
          .times { io << alphabet[0] }
      end

      io << encode(bytes.hexstring.to_big_i(16), alphabet, base: base)
    end
  end

  # Converts a base10 integer to a base-x string.
  def encode(
    int : Number,
    alphabet : String,
    base = alphabet.size
  ) : String
    String.build do |str|
      while int >= base
        mod = int % base
        str << alphabet[mod.to_big_i, 1]
        int = (int - mod).divmod(base).first
      end
      str << alphabet[int.to_big_i, 1]
    end.reverse
  end

  {% for method in %w[decode decode_bytes] %}
      # Converts a base-x string to bytes.
      def {{method.id}}(
        str : String,
        alphabet : String,
        base = alphabet.size
      ) : Bytes
        zeroes = str.chars.index { |c| c != alphabet[0] } || str.size - 1

        String.build do |io|
          zeroes.times { io << "00" } if zeroes.positive?
          hex = decode_int(str, alphabet, base: base).to_s(16)
          io << '0' if hex.size.odd?
          io << hex
        end.hexbytes
      end
    {% end %}

  # Converts a base-x string to a base10 integer.
  def decode_int(
    str : String,
    alphabet : String,
    base = alphabet.size
  ) : BigInt
    base = base.to_big_i

    str.reverse.chars.map_with_index do |char, index|
      unless char_index = alphabet.index(char)
        raise DecodingError.new("Value is not a valid Base#{base} String")
      end

      char_index.to_big_i * (base ** index)
    end.sum
  end

  {% for base, alphabets in BaseX.annotation(Alphabets).named_args %}
    module {{base.titleize.id}}
      extend self

      {% for name, alphabet in alphabets %}
        {{name.upcase.id}} = {{alphabet}}
      {% end %}

      {% alphabet_size = alphabets[:default].size %}

      def encode(
        bytes : Bytes,
        alphabet = DEFAULT,
        leading_zeroes = true
      ) : String
        BaseX.encode(bytes, alphabet, leading_zeroes, {{alphabet_size}})
      end

      def encode(
        int : Number,
        alphabet = DEFAULT
      ) : String
        BaseX.encode(int, alphabet, {{alphabet_size}})
      end

      {% for method in %w[decode decode_bytes] %}
        def {{method.id}}(
          str : String,
          alphabet = DEFAULT
        ) : Bytes
          BaseX.decode_bytes(str, alphabet, {{alphabet_size}})
        end
      {% end %}

      def decode_int(
        str : String,
        alphabet = DEFAULT
      ) : BigInt
        BaseX.decode_int(str, alphabet, {{alphabet_size}})
      end
    end
  {% end %}
end

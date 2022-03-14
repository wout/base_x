require "../spec_helper"

describe Base58::Binary do
  describe ".decode" do
    it "decodes with the default alphabet" do
      BINARY_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Binary.decode(encoded).should eq(decoded)
      end
    end

    it "decodes with the bitcoin alphabet" do
      BINARY_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Binary.decode(encoded, Base58::BITCOIN).should eq(decoded)
      end
    end

    it "decodes with the ripple alphabet" do
      BINARY_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Binary.decode(encoded, Base58::RIPPLE).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      Base58::Binary.decode("").should eq("\x00")
    end
  end

  describe ".encode" do
    it "encodes with the default alphabet" do
      BINARY_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Binary.encode(decoded).should eq(encoded)
      end
    end

    it "encodes with the bitcoin alphabet" do
      BINARY_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Binary.encode(decoded, Base58::BITCOIN).should eq(encoded)
      end
    end

    it "encodes with the ripple alphabet" do
      BINARY_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Binary.encode(decoded, Base58::RIPPLE).should eq(encoded)
      end
    end

    it "handles leading zeroes correctly with the default alphabet" do
      LEADING_ZEROES_EXAMPLES[:default].each do |example|
        bin = String.new(example[:hex].hexbytes)
        bin_no_zeroes = bin.gsub(/^#{"\u0000"}*/, "")

        Base58::Binary.encode(bin)
          .should eq(example[:b58])
        Base58::Binary.encode(bin, leading_zeroes: false)
          .should eq(example[:b58_no_zeroes])
        Base58::Binary.encode(bin_no_zeroes)
          .should eq(example[:b58_no_zeroes])
      end
    end

    it "handles leading zeroes correctly with the bitcoin alphabet" do
      LEADING_ZEROES_EXAMPLES[:bitcoin].each do |example|
        bin = String.new(example[:hex].hexbytes)
        bin_no_zeroes = bin.gsub(/^#{"\u0000"}*/, "")

        Base58::Binary.encode(bin, Base58::BITCOIN)
          .should eq(example[:b58])
        Base58::Binary.encode(bin, Base58::BITCOIN, false)
          .should eq(example[:b58_no_zeroes])
        Base58::Binary.encode(bin_no_zeroes, Base58::BITCOIN)
          .should eq(example[:b58_no_zeroes])
      end
    end

    it "handles leading zeroes correctly with the ripple alphabet" do
      LEADING_ZEROES_EXAMPLES[:ripple].each do |example|
        bin = String.new(example[:hex].hexbytes)
        bin_no_zeroes = bin.gsub(/^#{"\u0000"}*/, "")

        Base58::Binary.encode(bin, Base58::RIPPLE)
          .should eq(example[:b58])
        Base58::Binary.encode(bin, Base58::RIPPLE, false)
          .should eq(example[:b58_no_zeroes])
        Base58::Binary.encode(bin_no_zeroes, Base58::RIPPLE)
          .should eq(example[:b58_no_zeroes])
      end
    end
  end
end

require "../spec_helper"

describe Base58::Bytes do
  describe ".decode" do
    it "decodes with the default alphabet" do
      BYTES_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Bytes.decode(encoded).should eq(decoded)
      end
    end

    it "decodes with the bitcoin alphabet" do
      BYTES_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Bytes.decode(encoded, Base58::BITCOIN).should eq(decoded)
      end
    end

    it "decodes with the ripple alphabet" do
      BYTES_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Bytes.decode(encoded, Base58::RIPPLE).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      Base58::Bytes.decode("").should eq(Bytes[0])
    end
  end

  describe ".encode" do
    it "encodes with the default alphabet" do
      BYTES_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Bytes.encode(decoded).should eq(encoded)
      end
    end

    it "encodes with the bitcoin alphabet" do
      BYTES_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Bytes.encode(decoded, Base58::BITCOIN).should eq(encoded)
      end
    end

    it "encodes with the ripple alphabet" do
      BYTES_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Bytes.encode(decoded, Base58::RIPPLE).should eq(encoded)
      end
    end
  end
end

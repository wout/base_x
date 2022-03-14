require "../spec_helper"

describe Base58::Int do
  describe ".decode" do
    it "decodes with the default alphabet" do
      INT_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Int.decode(encoded).should eq(decoded)
      end
    end

    it "decodes with the bitcoin alphabet" do
      INT_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Int.decode(encoded, Base58::BITCOIN).should eq(decoded)
      end
    end

    it "decodes with the ripple alphabet" do
      INT_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Int.decode(encoded, Base58::RIPPLE).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      Base58::Int.decode("").should eq(0)
    end
  end

  describe ".encode" do
    it "encodes with the default alphabet" do
      INT_EXAMPLES[:default].each do |encoded, decoded|
        Base58::Int.encode(decoded).should eq(encoded)
      end
    end

    it "encodes with the bitcoin alphabet" do
      INT_EXAMPLES[:bitcoin].each do |encoded, decoded|
        Base58::Int.encode(decoded, Base58::BITCOIN).should eq(encoded)
      end
    end

    it "encodes with the ripple alphabet" do
      INT_EXAMPLES[:ripple].each do |encoded, decoded|
        Base58::Int.encode(decoded, Base58::RIPPLE).should eq(encoded)
      end
    end
  end
end

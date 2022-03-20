require "../spec_helper"

describe BaseX::Base58 do
  describe ".encode" do
    it "encodes bytes with the default alphabet" do
      BYTES_EXAMPLES[:base58][:default].each do |encoded, decoded|
        BaseX::Base58.encode(decoded).should eq(encoded)
      end
    end

    it "encodes bytes with the flickr alphabet" do
      BYTES_EXAMPLES[:base58][:flickr].each do |encoded, decoded|
        BaseX::Base58.encode(decoded, BaseX::Base58::FLICKR).should eq(encoded)
      end
    end

    it "encodes bytes with the ripple alphabet" do
      BYTES_EXAMPLES[:base58][:ripple].each do |encoded, decoded|
        BaseX::Base58.encode(decoded, BaseX::Base58::RIPPLE).should eq(encoded)
      end
    end
  end

  describe ".encode" do
    it "encodes an int with the default alphabet" do
      INT_EXAMPLES[:base58][:default].each do |encoded, decoded|
        BaseX::Base58.encode(decoded).should eq(encoded)
      end
    end

    it "encodes an int with the flickr alphabet" do
      INT_EXAMPLES[:base58][:flickr].each do |encoded, decoded|
        BaseX::Base58.encode(decoded, BaseX::Base58::FLICKR).should eq(encoded)
      end
    end

    it "encodes an int with the ripple alphabet" do
      INT_EXAMPLES[:base58][:ripple].each do |encoded, decoded|
        BaseX::Base58.encode(decoded, BaseX::Base58::RIPPLE).should eq(encoded)
      end
    end
  end

  describe ".decode_bytes" do
    it "decodes with the default alphabet" do
      BYTES_EXAMPLES[:base58][:default].each do |encoded, decoded|
        BaseX::Base58.decode(encoded).should eq(decoded)
      end
    end

    it "decodes with the flickr alphabet" do
      BYTES_EXAMPLES[:base58][:flickr].each do |encoded, decoded|
        BaseX::Base58.decode(encoded, BaseX::Base58::FLICKR).should eq(decoded)
      end
    end

    it "decodes with the ripple alphabet" do
      BYTES_EXAMPLES[:base58][:ripple].each do |encoded, decoded|
        BaseX::Base58.decode(encoded, BaseX::Base58::RIPPLE).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base58.decode("").should eq(Bytes[0])
    end
  end

  describe ".decode_int" do
    it "decodes with the default alphabet" do
      INT_EXAMPLES[:base58][:default].each do |encoded, decoded|
        BaseX::Base58.decode_int(encoded).should eq(decoded)
      end
    end

    it "decodes with the flickr alphabet" do
      INT_EXAMPLES[:base58][:flickr].each do |encoded, decoded|
        BaseX::Base58.decode_int(encoded, BaseX::Base58::FLICKR)
          .should eq(decoded)
      end
    end

    it "decodes with the ripple alphabet" do
      INT_EXAMPLES[:base58][:ripple].each do |encoded, decoded|
        BaseX::Base58.decode_int(encoded, BaseX::Base58::RIPPLE)
          .should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base58.decode_int("").should eq(0)
    end

    it "fails to decode an invalid base58 string" do
      expect_raises(BaseX::DecodingError) do
        BaseX::Base58.decode_int("nh?")
      end
    end
  end
end

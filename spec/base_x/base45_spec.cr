require "../spec_helper"

describe BaseX::Base45 do
  describe ".encode" do
    it "encodes bytes with the default alphabet" do
      BYTES_EXAMPLES[:base45][:default].each do |encoded, decoded|
        BaseX::Base45.encode(decoded).should eq(encoded)
      end
    end
  end

  describe ".encode" do
    it "encodes an int with the default alphabet" do
      INT_EXAMPLES[:base45][:default].each do |encoded, decoded|
        BaseX::Base45.encode(decoded).should eq(encoded)
      end
    end
  end

  describe ".decode_bytes" do
    it "decodes with the default alphabet" do
      BYTES_EXAMPLES[:base45][:default].each do |encoded, decoded|
        BaseX::Base45.decode(encoded).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base45.decode("").should eq(Bytes[0])
    end
  end

  describe ".decode_int" do
    it "decodes with the default alphabet" do
      INT_EXAMPLES[:base45][:default].each do |encoded, decoded|
        BaseX::Base45.decode_int(encoded).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base45.decode_int("").should eq(0)
    end

    it "fails to decode an invalid base45 string" do
      expect_raises(BaseX::DecodingError) do
        BaseX::Base45.decode_int("nh?")
      end
    end
  end
end

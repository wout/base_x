require "../spec_helper"

describe BaseX::Base2 do
  describe ".encode" do
    it "encodes bytes with the default alphabet" do
      BYTES_EXAMPLES[:base2][:default].each do |encoded, decoded|
        BaseX::Base2.encode(decoded).should eq(encoded)
      end
    end
  end

  describe ".encode" do
    it "encodes an int with the default alphabet" do
      INT_EXAMPLES[:base2][:default].each do |encoded, decoded|
        BaseX::Base2.encode(decoded).should eq(encoded)
      end
    end
  end

  describe ".decode_bytes" do
    it "decodes with the default alphabet" do
      BYTES_EXAMPLES[:base2][:default].each do |encoded, decoded|
        BaseX::Base2.decode(encoded).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base2.decode("").should eq(Bytes[0])
    end
  end

  describe ".decode_int" do
    it "decodes with the default alphabet" do
      INT_EXAMPLES[:base2][:default].each do |encoded, decoded|
        BaseX::Base2.decode_int(encoded).should eq(decoded)
      end
    end

    it "decodes an empty input" do
      BaseX::Base2.decode_int("").should eq(0)
    end

    it "fails to decode an invalid base2 string" do
      expect_raises(BaseX::DecodingError) do
        BaseX::Base2.decode_int("nh?")
      end
    end
  end
end

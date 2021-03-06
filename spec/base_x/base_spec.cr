require "../spec_helper"

describe BaseX do
  describe ".encode" do
    it "encodes bytes with the default alphabet" do
      BaseX.encode(Bytes[255, 51, 0], base_16_alphabet)
        .should eq("ff3300")
    end
  end

  describe ".encode" do
    it "encodes an int with the default alphabet" do
      BaseX.encode(16724736, base_16_alphabet).should eq("ff3300")
    end
  end

  describe ".decode_bytes" do
    it "decodes with the default alphabet" do
      BaseX.decode("ff3300", base_16_alphabet)
        .should eq(Bytes[255, 51, 0])
    end

    it "decodes an empty input" do
      BaseX.decode("", base_16_alphabet).should eq(Bytes[0])
    end
  end

  describe ".decode_int" do
    it "decodes with the default alphabet" do
      BaseX.decode_int("ff3300", base_16_alphabet).should eq(16724736)
    end

    it "decodes an empty input" do
      BaseX.decode_int("", base_16_alphabet).should eq(0)
    end

    it "fails to decode an invalid base2 string" do
      expect_raises(BaseX::DecodingError) do
        BaseX.decode_int("nh?", base_16_alphabet)
      end
    end
  end
end

private def base_16_alphabet
  "0123456789abcdef"
end

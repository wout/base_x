require "yaml"
require "../spec_helper"

describe Base58::VERSION do
  describe "shard.yml" do
    it "matches the current version" do
      info = YAML.parse(File.read("./shard.yml"))

      Base58::VERSION.should eq(info["version"])
    end
  end
end

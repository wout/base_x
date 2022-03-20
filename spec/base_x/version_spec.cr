require "yaml"
require "../spec_helper"

describe BaseX::VERSION do
  describe "shard.yml" do
    it "matches the current version" do
      info = YAML.parse(File.read("./shard.yml"))

      BaseX::VERSION.should eq(info["version"])
    end
  end
end

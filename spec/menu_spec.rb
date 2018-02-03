require "menu"

describe Menu do

  subject(:menu) { described_class.new }

  describe "#show" do
    it "returns menu" do
      expect(menu.show).to be_instance_of(Hash)
    end
  end
end

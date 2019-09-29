require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  
  describe "#list" do
    it "returns a list of available dishes" do
      expect { menu.list }.to output.to_stdout
    end
  end
  # describe "#add" do
  #   it "adds a dish and price to the menu" do
  #     expect { menu.add("Pizza", 1000) }.not_to raise_error
  #   end
  # end
end

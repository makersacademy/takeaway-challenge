require_relative '../lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  describe "#menu" do
    it "should return the menu" do
      expect(menu.items).to eq({"Pepperoni Pizza" => 10, "Coke" => 1})
    end
  end
end
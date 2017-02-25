require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe "Showing list of dishes to user" do
    let(:dish) { double("tofu") }
    it "adds a dish to the menu list" do
      expect(menu.add(dish)).to include {dish}
    end
  end
end

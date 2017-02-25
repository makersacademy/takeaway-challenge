require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  context "#dishes" do
    it "returns a list of dishes" do
      expect(menu).to receive(:dishes)
      menu.dishes
    end
  end
end

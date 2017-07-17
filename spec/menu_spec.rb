require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) {
    { Margherita: 7.95,
    Tropicana: 10.80,
    Fiorentina: 9.90 }
  }
  let(:dish) { :salad }

  it "returns all the available dishes" do
    expect(menu.dishes).to eq dishes
  end

  it "checks if the name of the dish is included in the menu" do
    expect(menu.dish_included?(dish)).to be false
  end
end

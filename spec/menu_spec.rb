require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { :salad }

  it "checks if the name of the dish is included in the menu" do
    expect(menu.dish_included?(dish)).to be false
  end

  it "checks if the menu is empty" do
    expect(menu.dishes).not_to be_empty
  end

end

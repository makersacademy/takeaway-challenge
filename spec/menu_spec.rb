require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { :salad }

  it "checks if the name of the dish is included in the menu" do
    expect(menu.dish_included?(dish)).to be false
  end
end

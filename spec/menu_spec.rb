require "menu"

describe Menu do
  let(:dish) { double(:dish, :name => "Saag Paneer", :Description => "Cheesy green goodness", :price => 4) }
  subject(:menu) { described_class.new }

  it "Can add a dish to the menu" do
    menu.add_dish(dish)
    expect(menu.dishes).to include dish
  end
end

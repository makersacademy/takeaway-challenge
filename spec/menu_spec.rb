require 'menu'

describe Menu do

  subject(:menu) { described_class.new(food) }

  let(:food) do
    {
      wings: 5.00,
      pizza: 7.00
    }

  end

  it "it has a list of food & prices" do
    expect(menu.food).to eq(food)
  end

  it "prints out a readable menu with prices" do
    readable_menu = "Wings £5.00, Pizza £7.00"
    expect(menu.print_menu).to eq(readable_menu)
  end

  it "it is able to see if a certain food is on the menu" do
    expect(menu.has_food?(:wings)).to be true
  end

  it "it is able to see if a certain food isn't on the menu" do
    expect(menu.has_food?(:cheesefries)).to be false
  end

  it "it calculates a price" do
    expect(menu.price(:wings)).to eq(food[:wings])
  end
end

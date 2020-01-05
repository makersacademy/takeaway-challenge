require "order"
require "menu"

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      pizza: 1,
      felafel: 2
    }
  end

  before do 
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true) #mock menu that has method #has_dish
    allow(menu).to receive(:has_dish?).with(:felafel).and_return(true)
  end


  it "selects dishes from menu" do
    order.add(:pizza, 1)
    order.add(:felafel, 2) #commands 
    expect(order.dishes).to eq(dishes) # queries / dishes set as stub
  end

  it "dosnt allow item not in menu to be added" do #add menu to test
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)

    expect{ order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!" # Beef checked as #{dish.capitalize}
  end
end
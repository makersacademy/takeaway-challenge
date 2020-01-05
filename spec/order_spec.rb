require "order"

describe Order do

  subject(:order) { described_class.new }

  let(:dishes) { double(:menu) }

  let(:dishes) do
    {
      pizza: 1,
      felafel: 2
    }
  end

  it "selects dishes from menu" do
    order.add(:pizza,1)
    order.add(:felafel,2) #commands 
    expect(order.dishes).to eq(dishes) # queries / dishes set as stub
  end

  it "dosnt allow item not in menu to be added" do #add menu to test
    expect{ order.add(:beef,1) }.to raise_error "This is not on the menu!"
  end
end
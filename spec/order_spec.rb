require "order"

describe Order do

  subject(:order) { described_class.new }

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
end
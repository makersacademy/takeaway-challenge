require "order"

describe Order do
  subject(:order) { described_class.new(menu) }
  
  let(:menu){ instance_double("Menu") }
  let(:dishes) do
      {
        rice: 2
      }
  end
  before do
    
    allow(menu).to receive(:price).with(:rice).and_return(4.00)
  end
  
  it "can add items to an order" do
    order.add(:rice, 2)
    expect(order.dishes).to eq dishes
  end
  
  it "can calculate the total for an order" do
    order.add(:rice, 2)
    total = 8.00
    expect(order.total).to eq total
  end
end

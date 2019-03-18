
require 'order'
require 'menu'

describe Order do 
  subject(:order) { described_class.new(menu) }

  let(:dishes) do 
    { chicken: 1, chinese: 2 }
  end 

  let(:menu) { double(:menu) }

  before do 
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chinese).and_return(true)
    allow(menu).to receive(:price).with(:chinese).and_return(8)
    allow(menu).to receive(:price).with(:chicken).and_return(5)
  
  end 

  it "selects several dishes" do 
    order.add(:chicken, 1)
    order.add(:chinese, 2)
    p order.dishes
    expect(order.dishes).to eq(dishes)

  end 

  it "doesnt allow items to be added that are not on the menu" do 
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error "item is not on the menu"
  end 

  it 'calculates total' do
    order.add(:chicken, 1)
    order.add(:chinese, 2)
    expect(order.total).to eq 21
  end 

end

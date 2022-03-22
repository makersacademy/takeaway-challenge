require "order"
require "menu"

describe Order do 

  subject(:order) { described_class.new(menu) } 

  let(:menu) { instance_double("Menu") } 

  let(:dishes) do 
    { 
        korma: 2, 
        balti: 1
     }
  end 

  before do 
    allow(menu).to receive(:dish_available?).with(:korma).and_return(true)
    allow(menu).to receive(:dish_available?).with(:balti).and_return(true)
    allow(menu).to receive(:price).with(:korma).and_return(8.00)
    allow(menu).to receive(:price).with(:balti).and_return(9.00)
  end 

  it 'can select multiple dishes from the menu' do 
    order.add(:korma, 2)
    order.add(:balti, 1)
    expect(order.dishes).to eq(dishes)    
  end 

  it 'will not allow items that are not on the menu to be selected' do
    allow(menu).to receive(:dish_available?).with(:curry).and_return(false) # stub
    expect { order.add(:curry, 3) }.to raise_error("Curry is not available")
  end 

  it 'calculates the total for the order' do 
    allow(menu).to receive(:dish_available?).with(:curry).and_return(false)
    order.add(:korma, 2)
    order.add(:balti, 1)
    total = 17.00
    expect(order.total).to eq total 
  end 
end

require "order"

describe Order do 

  subject(:order) { described_class.new(menu) } 

  let(:menu) { double(:menu) } 

  let(:dishes) do 
    { 
        korma: 2, 
        balti: 1
     }
  end 

  before do 
    allow(menu).to receive(:dish_available?).with(:korma).and_return(true)
    allow(menu).to receive(:dish_available?).with(:balti).and_return(true)
  end 

  it 'can select multiple dishes from the menu' do 
    order.add(:korma, 2)
    order.add(:balti, 1)
    expect(order.dishes).to eq(dishes)    
  end 

  it 'will not allow items that are not on the menu to be selected' do
    allow(menu).to receive(:dish_available?).with(:curry).and_return(false)
    expect { order.add(:curry, 3) }.to raise_error("Curry is not available")
  end 
end

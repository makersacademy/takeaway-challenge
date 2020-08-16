require 'takeaway'

describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu, order: order) }
    
  let(:menu) { double("menu") }
  let(:order) { double("order") }
  let(:dishes) { {Pizza: 1, Burger: 1} }
   
  it 'displays a menu showing the dishes and prices' do
    allow(menu).to receive(:view).and_return("Pizza: £11.99")
    
    expect(takeaway.view_menu).to eq("Pizza: £11.99")
  end
  
  it 'allows customer to order different quantities of available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)

  end   

end
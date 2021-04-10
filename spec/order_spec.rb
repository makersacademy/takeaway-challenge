require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { double(:takeaway) }

  before do
    order.place_order("Risotto", 1)
  end 

  it 'allows the customer to select dishes off the menu' do
    expect(order.selection).to eq({ :Risotto => 1 })
  end

  it 'adds these orders into a shopping cart' do
    expect(order.cart).to eq([{ :Risotto => 1 }])
  end 

  # it 'only allows selection of available dishes' do

  # end 

end 

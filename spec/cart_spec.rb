require 'cart'

describe Cart do

  let(:cart)      { Cart.new }
  let(:customer)  { double :customer }
  let(:menu)      { double :menu }

  it 'should have a contents that is empty to begin with' do
    expect(cart.contents).to be_empty
  end

  it 'should include the customers selections' do
    allow(customer).to receive(:select_dishes) { cart.contents << 'item 1' << 'item 2' }
    customer.select_dishes
    expect(cart.contents).to eq ['item 1', 'item 2']
  end

  it 'should be able to add up a total price for items' do
    cart.contents << {item: :cod, price: 6.00}
    expect(cart.total).to eq 6
  end


end

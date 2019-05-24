require 'order'

describe Order do 
  let(:order) { Order.new }
  it 'initializes with an empty list of items' do 
    expect(order.items).to be_empty
  end 

  it 'adds selections to an order' do 
    updated_items = order.add_to_cart("Margherita")
    expect(updated_items).to include("Margherita")
  end 
  
  it 'calculates the total of an order' do
    order.add_to_cart({item: "Margherita", price: 10, quantity: 2})
    expect(order.total).to eq(20)
  end 

  it 'checks the order total against user\'s total' do 
    order.add_to_cart({item: "Margherita", price: 10, quantity: 2})

    expect(order.check_total(20)).to eq(true)
  end 
end 
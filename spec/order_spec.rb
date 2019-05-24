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
  end 
end 
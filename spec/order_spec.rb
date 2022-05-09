require 'order'

describe Order do 

  it 'prints the menu' do
    expect(subject.print_menu).to include("Sushi set" => 12)  
  end

  it 'tells user that an item is not on the menu' do
    expect { subject.user_order("cake") }.to output("Item not on menu\n").to_stdout
  end

  it 'returns a total' do
    order = Order.new
    order.user_order("Sushi set")
    expect(order.order_total).to eq(12)
  end

end

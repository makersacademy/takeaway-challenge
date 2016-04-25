require 'takeaway'
describe TakeAway do
  subject(:takeaway){ described_class.new(menu,order)}
  let(:order){double :order}
  let(:menu){double :menu, display_menu: {"Fried Rice" => 5.99, "Chicken Chow Mein" => 7.99, "Cheeseburger" => 6.99, "Pizza" => 8}}
  let(:text_message){double :messages, send_message: nil}

  it 'shows the menu' do
    expect(takeaway.read_menu).to eq menu.display_menu
  end

  it 'raises an error if item is not available' do
    item = "Turkey Sandwich"
    expect{takeaway.order_food(item, 2)}.to raise_error "#{item} not available"
  end

  it 'confirms order added' do
    allow(order).to receive(:order_food).with(any_args)
    message = "2 order(s) of Fried Rice added to your cart"
    expect(takeaway.order_food("Fried Rice", 2)).to eq message
  end

  it 'confirms order is placed' do
    message = "Your order has been placed"
    allow(order).to receive(:total).and_return(12.99)
    expect(takeaway.confirm_order(12.99, text_message)).to eq message
  end

  it 'empties the cart after confirmed order' do
    message = "Your order has been placed"
    allow(order).to receive(:total).and_return(12.99)
    takeaway.confirm_order(12.99, text_message)
    expect(takeaway.order_summary).to be_empty
  end

  it 'shows total' do
    allow(order).to receive(:total).and_return(12.99)
    expect(takeaway.total).to eq "Your total is $#{order.total}"
  end

  it 'raises an error if incorrect total' do
    allow(order).to receive(:total).and_return(13.00)
    expect{takeaway.confirm_order(12.99,text_message)}.to raise_error 'Incorrect total'
  end

end

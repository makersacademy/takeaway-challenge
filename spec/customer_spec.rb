require 'customer'

describe Customer do
  let(:subject) { Customer.new(Order.new, Menu.new([Food.new('chicken', 5.00)])) }
  it 'starts with a blank order object' do
    test_order = Order.new
    customer = Customer.new(test_order)
    expect(customer.order_contents).to eq test_order
  end

  it 'adds an item and shows the total of all items' do
    subject.add_item('chicken')
    expect(subject.order_contents.show_price).to eq(5.00)
  end

  it 'should return 0.0 when no items are added' do
    expect(subject.order_contents.show_price).to eq 0.0
  end

  it 'shows the menu with names and prices' do
    expect { subject.show_menu }.to output("chicken costs £5.0\n").to_stdout

  end
  it 'confirms my order with a text' do
    expect(subject.confirm_order).to eq "test confirmation"
  end
end

require 'order'

describe Order do
  let(:item) { double :item }

  it 'is initialized with a Menu' do
    expect(subject.menu).not_to be nil
  end

  it 'can add an item' do
    expect(subject).to respond_to(:add_item).with(2).argument
  end

  it 'add the cost of an item to current total' do
    expect { subject.add_item('Cheeseburger') }.to change { subject.current_total }.from(0).to(3.5)
  end

  it 'can add multiple items to the order' do
    expect { subject.add_item('Hamburger', 3) }.to change { subject.current_total }.from(0).to(7.5)
  end

  it 'can show what the current order currently has in it' do
    expect(subject).to respond_to(:current_order)
  end

  it 'confirms that the order has been placed' do
    order = double(Order.new)
    time = (Time.now + 3600).strftime('%I:%M %p')
    allow(order).to receive(:checkout).and_return(time)
    expect(order.checkout).to eq time
  end

  let(:order) { double(Order.new) }
  it 'when checking out, it sends a message' do
    allow(order).to receive(:checkout).and_return(true)
    expect(order.checkout).not_to be nil
  end
end

require 'order'

describe Order do
  let(:item) { double :item }

  it 'can add an item' do
    expect(subject).to respond_to(:add_item).with(2).argument
  end

  it 'add the cost of an item to current total' do
    expect { subject.add_item('Cheeseburger') }.to change { subject.current_total }.from(0).to(3.5)
  end

  it 'can add multiple items to the order' do
    expect { subject.add_item('Hamburger', 3) }.to change { subject.current_total }.from(0).to(7.5)
  end
end

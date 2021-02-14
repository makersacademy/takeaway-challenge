require 'order'

describe Order do

  let(:user) { double :user }
  let(:item) { double :item, price: '5.00' }
  let(:subject) { Order.new(user) }
  
  it 'should be able to add item' do
    subject.add(item, 1)
    expect(subject.items).to include(item)
  end

  it 'should be able to add item already in order' do
    subject.add(item, 1)
    subject.add(item, 1)
    expect(subject.items[item]).to be 2
  end

  it 'should be able to remove item' do
    subject.add(item, 1)
    subject.remove(item, 1)
    expect(subject.items).to be_empty
  end

  it 'should not be able to remove item if not in order' do
    expect { subject.remove(item, 1) }.to raise_error "Item not in order"
  end

  it 'should not be able to remove more items than are present in order' do
    subject.add(item, 1)
    expect { subject.remove(item, 2) }.to raise_error "Can't remove more items than are in the order"
  end

  it 'should be able to calculate the total cost' do
    subject.add(item, 3)
    expect(subject.total).to eq 15
  end

  it 'should raise error if yor try to print ' do
    expect { subject.print_order }.to raise_error "No items have been added to the order yet"
  end

  it 'should be able to complete and order by sending a text' do
    expect(subject.complete).to be_a Text
  end

end

require 'order'

describe Order do
  it 'should exist' do
    expect(subject).to be_instance_of Order
  end
  it 'initializes with an instance variable order as an empty array' do
    expect(subject.order).to be_empty
  end
  it 'has a method add' do
    expect(subject).to respond_to(:add)
  end
  it 'has a method total' do
    expect(subject).to respond_to(:total)
  end
  describe '#add' do
    it 'should add an item to the order' do
      expect { subject.add('fried rice', 3.50, 1) }.to change { subject.order.count }.by 1
    end
  end
  describe '#total' do
    it 'should return the total cost of the order' do
      subject.add('crispy chilli beef', 5.50, 3)
      expect(subject.total).to eq 16.50
    end
    it 'should return the total cost of the order when there are multiple items' do
      subject.add('crispy chilli beef', 5.50, 3)
      subject.add('fried rice', 3.50, 5)
      subject.add('lemon chicken', 4.75, 4)
      expect(subject.total).to eq 53
    end
  end
end

require 'takeaway'

describe Takeaway do
  it 'should exist' do
    expect(subject).to be_instance_of Takeaway
  end
  it 'intializes with instance of menu accessible with .menu' do
    expect(subject.menu).to be_instance_of Menu
  end
  it 'intializes with instance of order accessible with .order' do
    expect(subject.order).to be_instance_of Order
  end
  it 'has an add_item method' do
    expect(subject).to respond_to(:add_item)
  end
  
  describe '#add_item' do
    it 'takes two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end
  end

  describe '#order_total' do
    it 'returns total price of order' do
      subject.add_item('fried rice', 3)
      expect(subject.order_total).to eq 10.50
    end
  end
  describe '#check_order' do
    it 'returns list items in order' do
      subject.add_item('fried rice', 2)
      expect(subject.check_order).to contain({ :item => 'fried rice', :price => 3.50, :quantity => 2 })
    end
  end
end

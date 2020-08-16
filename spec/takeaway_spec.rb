require 'takeaway'

describe Takeaway do
  it 'should exist' do
    expect(subject).to be_instance_of Takeaway
  end
  it 'intializes with instance of order accessible with .order' do
    expect(subject.order).to be_instance_of Order
  end
  it 'has an add_item method' do
    expect(subject).to respond_to(:add_item)
  end
  it 'has a place_order method' do
    expect(subject).to respond_to(:place_order)
  end
  it 'has a view_menu method' do
    expect(subject).to respond_to(:view_menu)
  end
  
  describe '#view_menu' do
    
  end

  describe '#add_item' do
    it 'takes two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end
    it 'gives an error if item is not on menu' do
      expect { subject.add_item 'pad thai' }.to raise_error 'Item is not available'
    end
    it 'does not give an error if item is on menu' do
      expect { subject.add_item 'spring rolls' }.not_to raise_error
    end
  end

  describe '#order_total' do
    it 'returns total price of order' do
      subject.add_item('fried rice', 3)
      expect(subject.order_total).to eq 10.50
    end

    it 'raises error if you check total of empty order' do
      expect { subject.order_total }.to raise_error "You haven't ordered anything yet"
    end

    it "doesn't raise error if you check total of an order with items" do
      subject.add_item('spring rolls')
      expect { subject.order_total }.not_to raise_error
    end
  end
  describe '#check_order' do
    it 'returns list items in order' do
      subject.add_item('fried rice', 2)
      expect(STDOUT).to receive(:puts).with("2 X fried rice for £3.5 each")
      subject.check_order
    end

    it 'raises error if you try to check an empty order' do
      expect { subject.check_order }.to raise_error "You haven't ordered anything yet"
    end

    it "doesn't raise an error if you check an order with something in" do
      subject.add_item('spring rolls')
      expect { subject.check_order }.not_to raise_error
    end
  end
  # could not figure out how to test this properly using doubles/mocking
  # describe '#place_order' do
  #   it 'sends order confirmation text' do
  #     expect(subject.place_order).to receive(:text)
  #     subject.place_order
  #   end
  # end
end

require 'takeaway'

describe Takeaway do
  let(:order) { double :order, num: 1, quantity: 2}
  let (:order_class_double) { double :order_class, new: order }

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  context 'when one dish is ordered' do
    before do
      subject.order_item(1)
    end

    it 'returns the item and cost' do
      takeaway = Takeaway.new(order_class_double)
      takeaway.order_item(1)
      expect(takeaway.orders).to include(order)
    end

    it 'shows the total cost of the order' do
      expect(subject.total_cost).to eq 4
    end
  end

  context 'when user orders a quantity of one dish' do 
    before do
      subject.order_item(1, 2)
    end

    it 'returns quantity of dishes' do
      takeaway = Takeaway.new(order_class_double)
      takeaway.order_item(1, 2)
      expect(takeaway.orders).to include(order)
    end
    
    it 'includes quantity in total cost' do
      expect(subject.total_cost).to eq 8
    end
  end

  context 'when user orders more than one dish' do 
    before do
      subject.order_item(1, 2)
      subject.order_item(2)
    end

    it 'stores orders' do
      expect(subject.orders.count).to eq 2
    end
  end
end

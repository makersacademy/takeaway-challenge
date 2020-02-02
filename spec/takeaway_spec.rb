require 'takeaway'

describe Takeaway do
  let(:order) { double :order, num: 1, quantity: 2, dish: "Egg Kathi roll", cost: 4}
  let(:order_class_double) { double :order_class, new: order }
  let(:takeaway) { Takeaway.new(order_class_double) } 

  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end

  context 'when a dish is ordered' do
    before do
      allow(order).to receive(:cost).and_return(4)
      takeaway.order_item(1)
    end

    it 'stores order details' do
      expect(takeaway.orders).to include(order)
    end

    it 'shows the total cost of the order' do
      expect(takeaway.total_cost).to eq 4
    end
  end

  context 'when user orders a quantity of one dish' do 
    before do
      allow(order).to receive(:cost).and_return(8)
      takeaway.order_item(1, 2)
    end
    
    it 'includes quantity in total cost' do
      expect(takeaway.total_cost).to eq 8
    end
  end

  context 'when user orders more than one dish' do 
    before do
      takeaway.order_item(1, 2)
      takeaway.order_item(2)
    end

    it 'stores orders' do
      expect(takeaway.orders.count).to eq 2
    end

  end

  describe '#check_order' do
    it 'raises an error if no orders placed' do
      expect{ takeaway.check_order }.to raise_error "No orders placed"
    end
    
    it 'prints the orders' do
      allow(order).to receive(:cost).and_return(8)
      allow(order)
      takeaway.order_item(1, 2)
      takeaway.order_item(2)
      expect { takeaway.check_order }.to output.to_stdout
    end
  end

  describe '#complete_order' do

    it 'raises an error if no orders placed' do
      expect{ takeaway.complete_order }.to raise_error "No orders placed"
    end
    
    it 'shows a confirmation message' do
      takeaway.order_item(1, 2)
      confirmation_message = "Thank you! Your order was placed and will be delivered before #{Time.now + 60}\n"
      expect { takeaway.complete_order }.to output(confirmation_message).to_stdout
    end
  end
end

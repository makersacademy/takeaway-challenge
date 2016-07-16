require 'current_order'

describe CurrentOrder do

  context 'the creation of an order' do

    it 'starts with an empty order' do
      expect(subject.customer_order.count).to eq 0
    end

    it 'stores a customers order' do
      subject.create_order 'Olives', 2
      expect(subject.customer_order[0][:selection]).to eq 'Olives'
    end

    it 'calculates the correct total for a given menu' do
      subject.create_order 'Olives', 2
      subject.create_order 'Pizza', 1
      expect(subject.order_total).to eq 8
    end

    it 'shows the items ordered' do
      subject.create_order 'Olives', 2
      expect(subject.view_order).to include 'Olives'
    end

    it 'shows the quantity ordered' do
      subject.create_order 'Olives', 2
      expect(subject.view_order).to include '2'
    end
  end

  context 'after a successful checkout' do

    it 'has a method to clear an order' do
      subject.create_order 'Pizza', 1
      subject.reset_order!
      expect(subject.order_total).to eq 0
    end

  end
end

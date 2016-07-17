require 'current_order'

describe CurrentOrder do

  let(:current_order) { described_class.new }

  context 'the creation of an order' do

    it 'starts with an empty order' do
      expect(current_order.customer_order.count).to eq 0
    end

  end

  context 'the creation of an order' do

    before(:each) { current_order.create_order 'Olives', 2 }

    it 'stores a customers order' do
      expect(current_order.customer_order[0][:selection]).to eq 'Olives'
    end

    it 'calculates the correct total for a given menu' do
      current_order.create_order 'Pizza', 1
      expect(current_order.order_total).to eq 8
    end

    it 'shows the items ordered' do
      expect(current_order.view_order).to include 'Olives'
    end

    it 'shows the quantity ordered' do
      expect(current_order.view_order).to include '2'
    end
  end

  context 'after a successful checkout' do

    it 'has a method to clear an order' do
      current_order.reset_order!
      expect(subject.order_total).to eq 0
    end

  end
end

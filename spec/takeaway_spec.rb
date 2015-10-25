require 'takeaway'

describe Takeaway do

  let(:order){ double(:order) }
  let(:order_klass){ double(:order_klass, new: order) }

  let(:menu){ double(:menu) }
  let(:menu_klass){ double(:menu_klass, new: menu)}

  subject(:takeaway){ Takeaway.new(order_klass, menu_klass) }

  context '#list_dishes' do
    it 'returns the result of @menu.list_dishes' do
      allow(menu).to receive(:list_dishes) { :dishes }
      expect(takeaway.list_dishes).to eq :dishes
    end
  end

  context '#place_order' do
    before :each do
      allow(order).to receive(:total) { 5 }
    end
    it 'raises error if provided total is different to @order.total' do
      expect{ takeaway.place_order(4) }.to raise_error Takeaway::WRONG_TOTAL_ERROR
    end
    it 'returns success mesage if total matches @order.total' do
      expect(takeaway.place_order(5)).to eq Takeaway::ORDER_SUCCESS_MSG
    end
  end

end

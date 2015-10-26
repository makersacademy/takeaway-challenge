require 'takeaway'

describe Takeaway do

  let(:order){ double(:order) }
  let(:order_klass){ double(:order_klass, new: order) }

  let(:menu){ double(:menu) }
  let(:menu_klass){ double(:menu_klass, new: menu) }

  let(:sms){ double(:sms, send: nil) }
  let(:sms_klass){ double(:sms_klass, new: sms) }

  subject(:takeaway){ Takeaway.new(order_klass, menu_klass, sms_klass) }

  context '#list_dishes' do
    it 'returns the result of @menu.list_dishes' do
      allow(menu).to receive(:formatted_dishes) { :dishes }
      expect(takeaway.list_dishes).to eq :dishes
    end
  end

  context '#add_to_order' do
    
  end

  context '#place_order' do
    it 'raises error if provided total is different to @order.total' do
      allow(order).to receive(:total) { 5 }
      expect{ takeaway.place_order(4) }.to raise_error Takeaway::WRONG_TOTAL_ERROR
    end
  end

end

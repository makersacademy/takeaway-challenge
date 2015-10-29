require 'takeaway'

describe Takeaway do

  let(:order){ double(:order, total: 5, receipt: :receipt) }
  let(:order_klass){ double(:order_klass, new: order) }

  let(:menu){ double(:menu, dishes: [:dish]) }
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
    it 'calls #add on the Order object' do
      expect(order).to receive(:add).with(:dish,1)
      takeaway.add_to_order(0,1)
    end
  end

  context '#place_order' do
    it 'raises error if provided total is different to @order.total' do
      expect{ takeaway.place_order(4) }.to raise_error Takeaway::WRONG_TOTAL_ERROR
    end
    it 'calls #order_success if provided total matches @order.total' do
      expect(takeaway).to receive(:order_success)
      takeaway.place_order(5)
    end
  end

  context '#order_success' do
    it 'calls #send on the Sms object' do
      expect(sms).to receive(:send).with(:receipt)
      takeaway.place_order(5)
    end
  end

end

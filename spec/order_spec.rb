require 'order'

describe Order do
  let(:order)               { described_class.new }
  let(:send_text)           { double :send_text }
  let(:confirmation_mock)   { double :confirmation }

  context 'new order' do
    describe '#initialize' do
      it 'starts with an empy basket' do
        expect(order.view_basket).to be_empty
      end

      it 'starts with a total of zero' do
        expect(order.view_total).to eq "£0"
      end
    end
  end

  context 'creating an order' do
    describe '#add' do
      it 'adds a dish and from the menu to the basket of an order' do
        order.add("doughnut")
        expect(order.view_basket).to eq([{ "doughnut" => 2 }])
      end
    end

    describe '#view_basket' do
      it 'can view the basket' do
        order.add("doughnut")
        order.add("cake")
        expect(order.view_basket).to eq([{ "doughnut" => 2 }, { "cake" => 2 }])
      end
    end
  end

  context 'pricing' do
    it 'adds the cost of a dish to #price_count' do
      order.add("doughnut")
      expect(order.price_count).to eq [2]
    end
  end

  context 'total of an order' do
    describe '#view_total' do
      it 'can display the current total of an order' do
        order.add("doughnut")
        order.add("cake")
        expect(order.view_total).to eq("£4")
      end
    end
  end

  context 'placing an order' do
    describe '#place_order' do
      it 'places an order and sends sms confirmation' do
        allow(confirmation_mock).to receive(:send_text)
        order.add("doughnut")
        order.add("cake")
        expect(order.place_order).to eq ("Order has been placed. It will arrive within 1 hour")
      end
    end
  end
end

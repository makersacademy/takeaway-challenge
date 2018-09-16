require 'order'

describe Order do
  # let(:menu_double)       { double :menu }
  let(:order)               { described_class.new }
  let(:dish_choice)         { double :dish }
  let(:send_text)           { double :send_text }
  let(:confirmation_mock)   { double :confirmation }


#-----------beginning of order-----------#

  describe 'a new order' do
    it 'starts with an empy basket' do
      expect(order.basket).to be_empty
    end

    it 'starts with a total of zero' do
      expect(order.total).to eq 0
    end
  end

  describe 'creating an order' do
    # before(:each) do
    #   #allow(menu_double).to receive(:dishes).and_return({ dish_choice => 1 })
    # end

#-----------basket of the order-----------#

    it 'adds a dish and from the menu to the basket of an order' do
      order.add("doughnut")
      expect(order.basket).to eq([{ "doughnut" => 2 }])
    end

    it 'can view the basket' do
      order.add("doughnut")
      order.add("cake")
      expect(order.view_basket).to eq([{ "doughnut" => 2 }, { "cake" => 2 }])
    end

#-----------prices of the order-----------#

    context 'pricing' do
      it 'adds the cost of a dish to #price_count' do
        order.add("doughnut")
        expect(order.price_count).to eq [2]
      end

      it 'can view a list of the prices of dishes in the order' do
        order.add("doughnut")
        order.add("cake")
        expect(order.prices).to eq [2, 2]
      end
    end

#-----------total of the order-----------#

    context 'total' do
      it 'can display the current total of an order' do
        order.add("doughnut")
        order.add("cake")
        expect(order.view_total).to eq("£4")
      end
    end

#-----------placing an order-----------#

    context 'placing an order' do
      it 'places an order and sends sms confirmation' do
        allow(confirmation_mock).to receive(:send_text)
        order.place_order(confirmation_mock)
      end
    end
  end
end

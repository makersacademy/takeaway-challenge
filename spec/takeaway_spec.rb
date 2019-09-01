require 'takeaway'

describe Takeaway do
  describe '#handle_sms' do
    let(:menu) { double(:menu) }
    let(:sms_formatter) { double(:sms_formatter) }
    let(:sms) { double(:sms) }
    let(:order_class) { double(:order_class) }
    let(:dishes) { 
      [
        Dish.new("dish_1", 10.0),
        Dish.new("dish_2", 8.0)
      ] 
    }

    it 'should send menu when asked in sms' do
      takeaway = Takeaway.new(menu, sms_formatter, sms)

      allow(sms_formatter).to receive(:parse_sms).and_return([:menu, nil])
      allow(menu).to receive(:list_dishes).and_return(dishes)
      expect(sms_formatter).to receive(:format_menu).with(
        dishes
      ).and_return(
        "reply_sms"
      )
      expect(sms).to receive(:send_sms).with("reply_sms")

      takeaway.handle_sms('menu')
    end

    it 'should send confirmation for a good order' do
      takeaway = Takeaway.new(menu, sms_formatter, sms, order_class)

      order_dishes = [
        { name: "dish_1", quantity: 2 }
      ]
      price = 20
      order = double(:order)

      allow(sms_formatter).to receive(:parse_sms).and_return([
        :order, [order_dishes, price]
      ])
      expect(order_class).to receive(:new).with(
        order_dishes, price
      ).and_return(order)
      allow(menu).to receive(:list_dishes).and_return(dishes)
      expect(order).to receive(:valid).with(dishes)
      expect(sms).to receive(:send_sms)

      takeaway.handle_sms("order")
    end    
  end
end

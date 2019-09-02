require 'sms_formatter'

describe SmsFormatter do
  describe '#parse_sms' do
    it 'should return menu if sms is requesting menu' do
      sms = "Menu"
      expect(subject.parse_sms(sms)).to eq [:menu, nil]
    end

    it 'should return order if sms is an order' do
      sms = "dish_a, 2\ndish_b, 3\nprice: 30.2"
      sms_type, order_data = subject.parse_sms(sms)
      dishes, price = order_data
      expect(sms_type).to eq(:order)
      expect(dishes).to eq([
        { name: "dish_a", quantity: 2 },
        { name: "dish_b", quantity: 3 },
      ])
      expect(price).to eq(30.2)
    end
  end

  describe '#format_menu' do
    it 'should convert menu to a tring' do
      dishes = [
        Dish.new("dish_a", 12.0),
        Dish.new("dish_b", 9.0),
      ]
      formatted = "Menu:\ndish_a: 12.0\ndish_b: 9.0\n"
      expect(subject.format_menu(dishes)).to eq(formatted)
    end
  end

end

require 'sms_formatter'

describe SmsFormatter do
  describe '#format_menu' do
    it 'should convert menu to a tring' do
      dishes = [
        Dish.new("dish_a", 12.0),
        Dish.new("dish_b", 9.0),
      ]
      formatted = "Menu:\ndish_a, 12.0\ndish_b, 9.0\n"
      expect(subject.format_menu(dishes)).to eq(formatted)
    end
  end

  describe '#parse_order' do
    it 'should parse an order from a string' do
      sms = "dish_a, 2\ndish_b, 3\nprice: 30"
      dishes, price = subject.parse_order(sms)
      expect(dishes).to eq([
        {name: "dish_a", quantity: 2},
        {name: "dish_b", quantity: 3},
      ])
      expect(price).to eq(30.0)
    end
  end
end

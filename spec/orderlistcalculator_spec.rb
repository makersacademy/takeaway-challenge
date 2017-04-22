require 'orderlistcalculator'

describe OrderListCalculator do

  let (:orderlistcalculator) { described_class }
  let(:dish_1) { double :dish, name: 'Fruit basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Salad Nicoise', price: 14.99 }
  let(:orderlist) { double :orderlist, contents: [dish_1, dish_2] }

    it 'calculaes total order price and number of dishes' do
      expect(orderlistcalculator.calculate(orderlist.contents))
      .to eq [orderlist.contents.size, dish_1.price + dish_2.price]
    end

end

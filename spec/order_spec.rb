require 'order'

describe Order do

  let(:order){ described_class.new(meals_list) }

  let(:meals_list){ {"beer"=>3.00} }

  context '#ordering dish' do

    it 'adds dish to order' do
      order.add_meals("beer",2)
      expect(order.basket).to eq "beer" => 2
    end

    it 'updates the quantity value of existing food' do
      order.add_meals("beer",2)
      order.add_meals("beer",4)
      expect(order.basket).to include "beer" => 6
    end

    it 'sets quantity to 1 by default' do
      order.add_meals("beer")
      expect(order.basket).to eq "beer" => 1
    end

  end

  context '#order total' do

    it 'calculates current total' do
      order.add_meals("beer")
      expect(order.current_total).to eq 3.00
    end

    it 'calculates overall total' do
      order.add_meals("beer",5)
      order.add_meals("beer",3)
      expect(order.current_total).to eq 24.00
    end
  end

end

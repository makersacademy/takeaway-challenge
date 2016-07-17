require 'order'

describe Order do
  let(:dish_list){{"pizza"=>3.00}}
  let(:order){described_class.new(dish_list)}

  context '#on initialize' do
    it 'the current total is 0' do
      expect(order.current_total).to be 0
    end

    it 'the basket is empty' do
      expect(order.basket).to be_empty
    end
  end

  context '#ordering dish'do
    it 'adds dish to order' do
      order.add_to_order("pizza",2)
      expect(order.basket).to eq "pizza" => 2
    end
    it 'updates the quantity value of existing food' do
      order.add_to_order("pizza",2)
      order.add_to_order("pizza",4)
      expect(order.basket).to include "pizza" => 6
    end
    it 'sets quantity to 1 by default' do
      order.add_to_order("pizza")
      expect(order.basket).to eq "pizza" => 1
    end
  end

  context '#order total' do
    it 'calculates current total' do
      order.add_to_order("pizza")
      expect(order.current_total).to eq 3.00
    end
    it 'calculates total' do
      order.add_to_order("pizza",5)
      order.add_to_order("pizza",3)
      expect(order.current_total).to eq 24.00
    end
  end

end

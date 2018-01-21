require 'order'

describe Order do

  let(:dish_list) { {"pierogi"=>4.00} }
  let(:order) { described_class.new(dish_list) }

  describe '#initialize' do
    it 'checks the current_total is 0' do
      expect(order.current_total).to be 0
    end

    it 'checks the basket is empty' do
      expect(order.basket).to be_empty
    end
  end

  describe 'ordering dish' do
    it 'adds dish to order' do
      order.add_to_order("pierogi", 4.00)
      expect(order.basket).to eq "pierogi" => 4.00
    end

    it 'updates the quantity of the food' do
      order.add_to_order("pierogi", 2)
      order.add_to_order("pierogi", 4)
      expect(order.basket).to include "pierogi" => 6
    end

    it 'sets quantity to 1 by default' do
      order.add_to_order("pierogi")
      expect(order.basket).to eq "pierogi" => 1
    end
  end

  describe '#order total' do
    it 'calculates current total' do
      order.add_to_order("pierogi")
      expect(order.current_total).to eq 4.00
    end

    it 'calculates total' do
      order.add_to_order("pierogi", 5)
      order.add_to_order("pierogi", 2)
      expect(order.current_total).to eq 28.00
    end
  end

end

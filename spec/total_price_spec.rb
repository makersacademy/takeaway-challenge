require 'total_price'

describe TotalPrice do
  let(:menu3) { double :menu3, add_dish: [{dish: "chips", price: 3 }, {dish: "burger", price: 5}],
  list_of_dishes: [{dish: "chips", price: 3 }, {dish: "burger", price: 5}], is_available?: true}
  let(:order1) { double :order1, dish_to_order: "chips", quantity: 1, order: [dish: "chips", quantity: 1] }
  let(:order2) { double :order2, dish_to_order: "burger", quantity: 1, order: {dish: "burger", quantity: 1}, item_to_order: {dish: "burger", quantity: 1}}
  let(:total_order) { double :total_order, add_to_order: [{dish: "chips", quantity: 1}, {dish: "burger", quantity: 1}] }

  describe '#get_prices_for_order' do
    it 'gets the prices for the items ordered' do
      menu3.add_dish
      order1.order
      order2.order
      total_order.add_to_order
      expect(subject.get_prices_for_order(menu3,order2)). to eq [3,5]
    end
  end

  describe '#calculate_total_price' do
    it 'calculates the total price of items ordered' do
      total_order.add_to_order
      subject.get_prices_for_order(menu3, order2)
      expect(subject.calculate_total_price). to eq 8
    end
  end

end

require 'total_order'

describe TotalOrder do

  let(:menu3) { double :menu3, add_dish: [{dish: "chips", price: 3 }, {dish: "burger", price: 5}], is_available?: true}
  let(:order1) { double :order1, dish_to_order: "chips", quantity: 1, order: {dish: "chips", quantity: 1}, item_to_order: {dish: "chips", quantity: 1}}
  let(:order2) { double :order2, dish_to_order: "burger", quantity: 1, order: {dish: "burger", quantity: 1}, item_to_order: {dish: "burger", quantity: 1}}
  let(:total_price) {double :total_price, print_total_price: 'Total Price: £8'}

  describe '#confirm_order' do
    it 'returns the list of dishes ordered and the price' do
      menu3.add_dish
      order1.order
      order2.order
      subject.add_to_order(order1)
      subject.add_to_order(order2)
      expect { subject.confirm_order(total_price) }.to output("Dish: chips, Quantity: 1\nDish: burger, Quantity: 1\n").to_stdout
    end
  end


end

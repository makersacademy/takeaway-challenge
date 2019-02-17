require './lib/order.rb'

describe Order do
  describe 'when customer selects to add dish to their order' do
    let (:dish_double) { double(:dish, price: 5.00)}
    let (:menu_double) { double(:menu, select: dish_double)}

    let (:order) { Order.new(menu_double) }

    let (:dish_no) { 1 }
    let (:qty) { 5 }

    it 'should request menu to return that dish' do
      order.add_dish(dish_no: dish_no, qty: qty)

      expect(menu_double).to have_received(:select).with(
        dish_no: dish_no,
      )
    end

    it 'should add selected dish to dishes within order' do
      order.add_dish(dish_no: dish_no, qty: qty)

      expect(order.items[0]).to eq({
        qty: qty,
        dish: dish_double 
      })
    end

    it 'should return current order total' do
      expected_total = 0

      3.times do
        current_total = order.add_dish(dish_no: dish_no, qty: qty)
        
        expected_total += dish_double.price * qty
        expected_formatted_total = "£#{'%.2f' % expected_total}"
        
        expect(current_total).to eq(expected_formatted_total)
      end
    end
  end
end
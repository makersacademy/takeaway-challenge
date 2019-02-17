require './lib/order.rb'

describe Order do
  describe 'when customer selects to add dish to their order' do
    let (:dish_double) { double(:dish)}
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
  end
end
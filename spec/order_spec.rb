require './lib/order.rb'

describe Order do
  let (:dish_double) { double(:dish, price: 5.00)}
  let (:menu_double) { double(:menu, select: dish_double)}
  let (:messenger_double) { double(:messenger, send: nil) }

  let (:order) { Order.new(menu: menu_double, messenger: messenger_double) }

  let (:dish_no) { 1 }
  let (:qty) { 5 }

  let (:mobile_number) { '077361387311' }
  let (:checkout_timestamp) { Time.new(2018,11,1,18,0,0, "+00:00") }
  let (:delivery_time) { "19:00" }

  before(:each) do
    allow(DateTime).to receive(:now).and_return(checkout_timestamp)
  end

  describe 'when customer selects to add dish to their order' do
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

  describe 'when customer requests to checkout order' do
    describe 'and the total the customer expects to pay does not match total' do
      it 'should throw error' do
        order.add_dish(dish_no: dish_no, qty: qty)
        
        expect { order.checkout(
          expected_total: 25.75, 
          mobile_number: mobile_number
          ) }
          .to raise_error(
          'Your expected total does not match order total'
        )
      end
    end

    describe 'and the total the customer expects to pay matches total' do
      it 'should request messenger to send confirmation message to customer' do
        order.add_dish(dish_no: dish_no, qty: qty)

        order.checkout(expected_total: 25, mobile_number: mobile_number)

        expected_message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
        
        expect(messenger_double).to have_received(:send)
          .with(message: expected_message, mobile_number: mobile_number)
      end
    end
  end
end
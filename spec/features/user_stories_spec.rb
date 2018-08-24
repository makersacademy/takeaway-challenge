require 'order_manager'

describe 'User Stories' do

  let(:text_double) { double :text_double, send: true }

  context 'Allows a customer to see a list of dishes with prices' do
    it 'Allows method to be called without error' do
      order = OrderManager.new
      expect { order.see_menu }.not_to raise_error
    end

    it 'Pretty prints the current menu' do
      order = OrderManager.new
      expect(order.see_menu).to eq(
        "1. Sea salt & caramel, £3.5\n"\
        "2. Chilli & chocolate, £3.5\n"\
        "3. Avocado cream, £4.0\n"\
        "4. Coconut, £3.0\n"\
        "5. Praline, £3.7\n"\
        "6. Watermelon sorbet, £3.5\n"\
        "7. Wild strawberry, £4.5\n"\
        "8. Dark chocolate & cherry, £5.5"
      )
    end
  end

  context 'Allows a customer to place an order' do
    context 'Allows customer to check the order total' do
      it 'Raises an error if an incorrect order total is provided' do
        order = OrderManager.new
        order_array = [{1=>1, 3=>1, 7=>1}, 15]
        expect { order.place_order(order_array) }.to raise_error("Incorrect order total provided!")
      end

      it 'Raises an error if an incorrect order is provided' do
        order = OrderManager.new
        order_array = [{1=>1, 3=>1, 10=>1}, 15]
        expect { order.place_order(order_array) }.to raise_error("Invalid dish selection!")
      end

      it 'Returns the total and sends text message if the correct total was provided' do
        order = OrderManager.new
        order_array = [{1=>1, 3=>1, 7=>1}, 12]
        expect { order.place_order(order_array) }.to output("\"Total cost = £12\"\n").to_stdout
      end
    end
  end
end

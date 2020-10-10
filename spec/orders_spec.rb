require 'orders'

describe Order do

  context '#initialize' do

    it ' is an instance of Order' do
      order_inst = Order.new
      expect(order_inst).to be_a Order
    end

    it ' has dish constant with array of menu items' do
      expect(Order::DISHES).to_not be_empty
    end

  end

  context '#print_menu' do

    it ' prints menu when called' do
      menu = "Menu:\n-----\n£7.99 : Pepperoni Pizza\n£7.49 : Margherita Pizza\n£3.00 : Chips\n£3.50 : Onion Rings\n£2.50 : Diet Coke\n£2.50 : Fanta\n"
      order_inst = Order.new
      expect { order_inst.print_menu }.to output(menu).to_stdout
    end
  end
end

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
      menu = "Menu:\n-----\nID001 - £7.99 : Pepperoni Pizza\nID002 - £7.49 : Margherita Pizza\nID003 - £3.00 : Chips\nID004 - £3.50 : Onion Rings\nID005 - £2.50 : Diet Coke\nID006 - £2.50 : Fanta\n"
      order_inst = Order.new
      expect { order_inst.print_menu }.to output(menu).to_stdout
    end
  end

  context '#enter_order' do

    it ' allows user to order using ID numbers and quantity' do
      order_inst = Order.new
      allow(order_inst).to receive(:gets).and_return("001", "2", "002", "1", "003", "1", "005", "3", "end")
      order_inst.order
      expect(order_inst.order_list).to eq [["001", "2"], ["002", "1"], ["003", "1"], ["005", "3"]]
    end
  end

  context '#print_order' do

    it ' displays the user\'s order back to them' do
      order = ["Your Order:\n\n", ]
      order_inst = Order.new
      allow(order_inst).to receive(:gets).and_return("001", "2", "002", "1", "003", "1", "005", "3", "end")
      order_inst.order

      order_inst.order_list.each { |each|
        order_select = Order::DISHES.select { |item| item[:id] == each[0]}
        order.push("£" + ((order_select[0][:price].to_i) * (each[1]).to_i ).to_s + " : " + each[1] + " x " + (order_select[0][:item]) + "\n")}
      expect { order_inst.print_order }.to output(order.join("")).to_stdout
    end

    it ' displays message if user hasn\'t ordered yet' do
      message = "You haven't ordered yet!...\n"
      order_inst = Order.new
      expect { order_inst.print_order }.to output(message).to_stdout
    end
  end
end

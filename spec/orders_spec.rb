require 'orders'

describe Order do
  let(:printer_class) { double 'PrinterClass', new: printer_dbl }
  let(:printer_dbl) { double 'PrinterClassInstance', menu: true, enter_id: nil, enter_quantity: nil, gets: "no", order: true }
  let(:dishes_class) { double 'DishesClass', new: dishes_dbl }
  let(:dishes_dbl) { double 'DishesClassInstance', select_item: true, DISHES: true }
  let(:phone_class) { double 'PhoneClass', new: phone_dbl }
  let(:phone_dbl) { double 'PhoneClassInstance', send_text: true}

  context '#initialize' do

    it ' is an instance of Order' do
      order_inst = Order.new(printer_class, phone_class, dishes_class)
      expect(order_inst).to be_a Order
    end

    it ' accesses dish constant with array of menu items' do
      expect(Dishes::DISHES).to_not be_empty
    end

  end

  context '#print_menu' do

    # it ' prints menu when called' do
    #   menu = "Menu:\n-----\nID001 - £7.99 : Pepperoni Pizza\nID002 - £7.49 : Margherita Pizza\nID003 - £3.00 : Chips\nID004 - £3.50 : Onion Rings\nID005 - £2.50 : Diet Coke\nID006 - £2.50 : Fanta\n"
    #   order_inst = Order.new
    #   expect { order_inst.print_menu }.to output(menu).to_stdout
    # end

    it ' accesses printer method to print formatted menu' do
      order_inst = Order.new(printer_class, phone_class, dishes_class)
      expect(order_inst.print_menu).to eq true
    end
  end

  context '#order' do
    before do

      allow_any_instance_of(Order).to receive(:gets).and_return("001", "2", "end")
    end

    it ' allows user to order using ID numbers and quantity' do
      order_inst = Order.new(printer_class, phone_class, dishes_class)
      order_inst.order
      expect(order_inst.order_list).to eq [["001", "2"]]
    end
  end

  context '#print_order' do

    it ' accesses printer.order method to print order' do
      order_inst = Order.new(printer_class, phone_class, dishes_class)
      expect(order_inst.print_order).to eq true
    end

  end

end

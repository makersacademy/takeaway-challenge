require 'print'

describe Printing do
  # let(:dishes_class) { double 'DishesClass', new: dishes_dbl }
  let(:dishes_dbl) { double 'DishesClassInstance', format_items: true }
  # let(:phone_class) { double 'PhoneClass', new: phone_dbl }
  let(:phone_dbl) { double 'PhoneClassInstance', send_text: true }

  context '#menu' do
    before do
      allow(dishes_dbl).to receive(:select_item).and_return(true)
    end

    it 'prints string and menu formatted' do
      print_inst = Printing.new(phone_dbl, dishes_dbl)
      expect { print_inst.menu }.to output("Menu:\n-----\ntrue\n").to_stdout
    end

  end

  context '#enter_id' do

    it 'prints string' do
      message = "Please enter the FULL ID number or 'end' to finish ordering: \n"
      print_inst = Printing.new(phone_dbl, dishes_dbl)
      expect { print_inst.enter_id }.to output(message).to_stdout
    end

  end

  context '#enter_quantity()' do

    it 'prints string with *TEST*' do
      message = "Please enter quantity of *TEST*\n"
      print_inst = Printing.new(phone_dbl, dishes_dbl)
      expect { print_inst.enter_quantity([{item: "*TEST*"}]) }.to output(message).to_stdout
    end

  end

  context '#order()' do
    let(:order_list) { double :order_list, empty?: false }
    before do
      allow_any_instance_of(Printing).to receive(:print).and_return(true)
      allow(dishes_dbl).to receive(:select_item).and_return([{item: 'test_item'}])
    end

    it " prints error if order is empty" do
      message = "You haven't ordered yet!...\n"
      print_inst = Printing.new(phone_dbl, dishes_dbl)
      expect { print_inst.order([]) }.to output(message).to_stdout
    end


    it " prints specific ordered items" do
      allow_any_instance_of(Printing).to receive(:gets).and_return("no")
      message = "Your Order:\n\n: 1 x test_item\n-----\nIs this correct?: yes/no\n"
      print_inst = Printing.new(phone_dbl, dishes_dbl)
      expect { print_inst.order([["1", "1"]]) }.to output(message).to_stdout
    end
  end
end

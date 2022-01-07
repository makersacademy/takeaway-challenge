require 'customer_interface'

describe CustomerInterface do

  describe "#initialize" do

    it "initializes with a menu" do
      expect(subject.menu).to_not be_empty
    end

  end 

  describe "#print_menu" do

    it { should respond_to(:print_menu) }

    it "prints the menu to the customer" do
      expect{ subject.print_menu }.to output{ subject.menu }.to_stdout
    end

  end

  describe "#select_dish" do

    it { should respond_to(:select_dish).with(1).argument }

    it "should add the selected dish to the order" do
      dish = "Katsu Chicken Curry"
      subject.select_dish(dish)
      expect(subject.order).to include(dish)
    end

  end

  describe "#remove_dish" do

    it { should respond_to(:remove_dish).with(1).argument }

    it "should remove the dish from the order" do
      dish = "Katsu Chicken Curry"
      subject.select_dish(dish)
      expect{ subject.remove_dish(dish) }.to change{ subject.order.length }.by -1 
    end

  end

  describe "#check_order" do

    it { should respond_to(:check_order) }

    it "should print the current order to the customer" do
      dish = "Katsu Chicken Curry"
      subject.select_dish(dish)
      expect{ subject.check_order }.to output{ subject.order }.to_stdout
    end

  end

  describe "#checkout" do

    it { should respond_to(:checkout) }

    it "should confirm the order has been placed" do
      confirmation = "Thank you, your order has been placed"
      expect{ subject.checkout }.to output{ confirmation }.to_stdout
    end

    it "should clear the order" do
      dish = "Katsu Chicken Curry"
      subject.select_dish(dish)
      subject.checkout
      expect(subject.order).to be_empty
    end

  end

end

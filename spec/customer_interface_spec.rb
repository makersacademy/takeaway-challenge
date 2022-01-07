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
      selected_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.select_dish(selected_dish)
      expect(subject.order.dishes).to include(selected_dish.name)
    end

  end

  describe "#remove_dish" do

    it { should respond_to(:remove_dish).with(1).argument }

    it "should remove the dish from the order" do
      removed_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.select_dish(removed_dish)
      expect{ subject.remove_dish(removed_dish) }.to change{ subject.order.dishes.length }.by -1
    end

  end

  describe "#check_order" do

    it { should respond_to(:check_order) }

    it "should print the list of dishes to the customer" do
      selected_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      another_dish = Dish.new("Sushi Platter", 21.99, 30)
      subject.select_dish(selected_dish)
      subject.select_dish(another_dish)
      expect{ subject.check_order }.to output{ subject.order.dishes }.to_stdout
    end

    it "should print the total price to the customer" do
      selected_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      another_dish = Dish.new("Sushi Platter", 21.99, 30)
      subject.select_dish(selected_dish)
      subject.select_dish(another_dish)
      expect{ subject.check_order }.to output{ subject.order.total_cost }.to_stdout
    end

    it "should print the current list of prices to the customer" do
      # selected_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      # subject.select_dish(selected_dish)
      # expect{ subject.check_order }.to output{ selected_dish.price }.to_stdout
    end

    it "should print the total preparation time to the customer" do
      selected_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      another_dish = Dish.new("Sushi Platter", 21.99, 30)
      subject.select_dish(selected_dish)
      subject.select_dish(another_dish)
      expect{ subject.check_order }.to output{ subject.order.prep_time }.to_stdout
    end

  end

  describe "#checkout" do

    it { should respond_to(:checkout) }

    it "should confirm the order has been placed" do
      confirmation = "Thank you, your order has been placed"
      expect{ subject.checkout }.to output{ confirmation }.to_stdout
    end

  end

end
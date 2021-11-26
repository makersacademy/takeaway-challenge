require 'menu'

describe Menu do
  before do
    @burger = double("Burger", :name => "Burger", :price => 8.5)
  end

  context "Listing dishes" do
    
    it "Responds to #dishes" do
      expect(subject).to respond_to (:dishes)
    end

    it "Returns a copy of dishes hash" do
      subject.add_dish(name: @burger.name, price: @burger.price)
      expect(subject.dishes).to eq(@burger.name => @burger.price)
    end
  end

  context "Adding dishes" do

    it "Responds to #add_dish" do
      expect(subject).to respond_to(:add_dish)
    end

    it "#add_dish accepts a dish class and add its an instance of it to the menu" do
      dish_class = double("DishClass")
      dish_class_instance = double("DishClass_instance")
      allow(dish_class).to receive(:new).and_return(dish_class_instance)
      
      menu = Menu.new(dish_class)
      allow(dish_class_instance).to receive_messages(
        :name => "Fries",
        :price => 3)
      
      menu.add_dish(name: "Fries", price: 3)
    end

    it "#add_dish adds dishes to dishes hash" do
      subject.add_dish(name: @burger.name, price: @burger.price)
      expect(subject.dishes.length).to eq 1
    end
  end
  
end

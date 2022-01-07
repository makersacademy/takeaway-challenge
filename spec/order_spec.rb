require 'order'

describe Order do

  describe "#initialize" do

    it "should initialize with an empty order" do
      expect(subject.dishes).to be_empty
    end

    it "should initialize with a total cost of zero" do
      expect(subject.total_cost).to eq 0
    end

    it "should initialize with a total prep time of zero" do
      expect(subject.total_prep_time).to eq 0
    end

  end

  describe "#add_dish" do

    it { should respond_to(:add_dish).with(1).argument }

    it "should add a dish to the order" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.add_dish(select_dish)
      expect(subject.dishes).to include(select_dish.name)
    end
    
    it "should add the dish price to the total order cost" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      expect{ subject.add_dish(select_dish) }.to change{ subject.total_cost }.by (select_dish.price)
    end

    it "should add the dish prep time to the total order prep time" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      expect{ subject.add_dish(select_dish) }.to change{ subject.total_prep_time }.by (select_dish.prep_time)
    end

  end

  describe "#remove_dish" do

    it { should respond_to(:remove_dish).with(1).argument }

    it "should remove a dish from the order" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.add_dish(select_dish)
      expect{ subject.remove_dish(select_dish) }.to change{ subject.dishes.length }.by -1
    end
    
    it "should minus the dish price from the total order cost" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.add_dish(select_dish)
      expect{ subject.remove_dish(select_dish) }.to change{ subject.total_cost }.by -(select_dish.price)
    end

    it "should minus the dish prep time from the total order prep time" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      subject.add_dish(select_dish)
      expect{ subject.remove_dish(select_dish) }.to change{ subject.total_prep_time }.by -(select_dish.prep_time)
    end

    it "should raise an error if there are no dishes in the order" do
      select_dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
      expect{ subject.remove_dish(select_dish) }.to raise_error "There are no dishes in your order."
    end

  end

end
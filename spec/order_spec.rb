require 'order'

describe Order do

  describe "#initialize/new" do
    it 'has a container for ordered dishes when initilized' do
      dishes = subject.ordered_dishes
      expect(dishes).to eq([])
    end
  end

  describe "#add_to_order" do
    it 'add dishes of given quantity to the order' do
      dish1 = double{:dish_object1}
      dish2 = double{:dish_object2}
      order = Order.new
      order.add_to_order(dish1,2)
      order.add_to_order(dish2,3)
      expect(order.ordered_dishes).to eq([{dish:dish1,quantity:2},
        {dish:dish2,quantity:3}])
    end
  end

  describe "#display_order" do
    it 'displays information about the order with total cost' do
      dish1 = double(:dish, name: 'Fried Rice')
      dish2 = double(:dish)
      # allow(dish1).to receive(:name).and_return('Fried Rice')
      allow(dish1).to receive(:price).and_return(3.95)
      allow(dish2).to receive(:name).and_return('Chicken Curry')
      allow(dish2).to receive(:price).and_return(4.90)
      order = Order.new
      order.add_to_order(dish1,2)
      order.add_to_order(dish2,4)
      display = order.display_order
      expected_display = "          Order Details \n\nFried Rice @ 3.95 x 2 "\
      " \u00A3 7.90\nChicken Curry @ 4.9 x 4  \u00A3 19.60\n----------------"\
      "-----------\nTotal:                \u00A3 27.50"
      expect(display).to eq(expected_display)
    end
  end

end

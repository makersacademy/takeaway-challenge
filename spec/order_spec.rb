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



end

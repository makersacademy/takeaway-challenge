require './lib/list.rb'
require './lib/dish.rb'

describe Order do
  subject(:order){described_class.new}

  it 'has an attribute current_order initialized to an empty array' do
    expect(order.current_order).to eq []
  end

  describe '#add' do
    it 'has method with two arguments' do
      expect(order).to respond_to(:add).with(3).argument
    end
    it 'add hash describing dish order to current_order' do
      dish1 = instance_double(Dish, :description => "Soup", :price => 1.00)
      dish2 = instance_double(Dish, :description => "Rice", :price => 0.50)
      list = List.new
      list.add(dish1)
      list.add(dish2)
      order.add(list, 1, 2)
      expect(order.current_order).to include({dish: dish1, quantity: 2})
    end
  end

  describe '#total' do
    it 'returns the current order total' do
      dish1 = instance_double(Dish, :description => "Soup", :price => 1.00)
      dish2 = instance_double(Dish, :description => "Rice", :price => 0.50)
      list = List.new
      list = List.new
      list.add(dish1)
      list.add(dish2)
      order.add(list, 1, 2)
      expect(order.total).to eq(2.00)
    end
  end

  describe '#read' do
    it 'returns the orders' do
    dish1 = instance_double(Dish, :description => "Soup", :price => 1.00)
    dish2 = instance_double(Dish, :description => "Rice", :price => 0.50)
    list = List.new
    list.add(dish1)
    list.add(dish2)
    order.add(list, 1, 2)
    expect(order.read).to eq([{description: dish1.description, quantity: 2}])
  end
 end

 describe '#place' do
   it 'error checks total given' do
    expect(subject).to receive(:the_message)
    dish1 = instance_double(Dish, :description => "Soup", :price => 1.00)
    dish2 = instance_double(Dish, :description => "Rice", :price => 0.50)
    list = List.new
    list.add(dish1)
    list.add(dish2)
    order.add(list, 1, 2)
    expect{order.place(4.00)}.to raise_error("Order total incorrect. Current total is #{order.total}")
    expect{order.place(2.00)}.not_to raise_error
 end
end

end

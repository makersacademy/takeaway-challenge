#FEATURE tests
require './lib/order'
require './lib/list'
require './lib/dish'
#Make a list and add dishes to it


describe 'making a list of dishes' do

    let(:list){List.new}
    let(:dish1){instance_double(Dish, :description => "Soup", :price => 3.00)}
    let(:dish2){instance_double(Dish, :description => "beef", :price => 5.00)}
    let(:order){Order.new}

    it 'can make a list and add dishes to it, then read it' do
      list.add(dish1)
      list.add(dish2)
      expect(list.read).to eq [dish1, dish2]
    end

    it 'can create an order and add dishes from the list to it' do
      list.add(dish1)
      list.add(dish2)
      list.add(dish1)
      order.add(list, 1, 1)
      expect(order.total).to eq 3.00
      expect(order.read).to eq [{description: dish1.description, quantity: 1}]
    end

    it 'can error check order total' do
      list.add(dish1)
      list.add(dish2)
      list.add(dish1)
      order.add(list, 1, 1)
      expect{order.place(4.00)}.to raise_error("Order total incorrect. Current total is #{order.total}")
  end


  it 'can error check order total' do
    list.add(dish1)
    list.add(dish2)
    list.add(dish1)
    order.add(list, 1, 1)
    expect(order).to receive(:the_message)
    order.place(3.00)
  end


end

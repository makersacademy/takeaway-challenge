require 'order'

describe Order do

  describe "#initialize/new" do
    it 'has a container for ordered dishes when initilized' do
      expect(subject.ordered_dishes).to eq([])
    end

    it 'starts off with order total of 0' do
      expect(subject.order_total).to eq(0)
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

  describe "#display_order_on_email" do
    it 'displays information about the order with total cost' do
      dish1 = double(:dish, name: 'Fried Rice', price: 3.95)
      dish2 = double(:dish, name: 'Chicken Curry', price: 4.90)
      order = Order.new
      order.add_to_order(dish1,2)
      order.add_to_order(dish2,4)
      display = order.display_order_on_email
      expected_display = "                  Order Details\n\nFried Rice @ 3.95"\
        " x 2                     £   7.90\nChicken Curry @ 4.9 x 4           "\
        "        £  19.60\n--------------------------------------------------"\
        "\nTotal                                     £  27.50"
      expect(display).to eq(expected_display)
    end
  end

  describe "#display_order_on_sms" do
    it 'displays a shortened format order information to send on sms' do
      
    end
  end
end

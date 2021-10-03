require 'order'

describe Order do
  let(:dish1) { double("Dish1", :name => "Burger", :price => 6) }
  let(:dish2) { double("Dish2", :name => "Chips", :price => 2) }
  let(:dish3) { double("Dish3", :name => "Chicken", :price => 5) }
  let(:order) { described_class.new }

  it "has an id" do
    expect(order.id).to eq(order.object_id)
  end

  it "starts with an empty basket" do
    expect(order.basket).to eq([])
  end

  context 'adding items:' do
    before do
      order.add(dish1)
      order.add(dish2)
      order.add(dish3)
    end

    it "stores items" do
      expect(order.basket).to eq([dish1, dish2, dish3])
    end

    it "can clear the current selection" do
      order.clear_basket
      expect(order.basket).to eq([])
    end

    it "shows the total price of the items" do
      expect(order.total).to eq(dish1.price + dish2.price + dish3.price)
    end

    it "calculates the delivery time and formats it into a string" do  
      one_hour_from_now = (Time.now + 3600).strftime("%H:%M")
      expect(order.delivery_time).to eq(one_hour_from_now)
    end
  end
end

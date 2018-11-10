require 'order'
require 'twilio-ruby'

describe Order do

  let(:dish_eggs) { double :eggs, name: "Eggs", price: 3 }
  let(:dish_sausages) { double :sausages, name: "Sausages", price: 4 }
  let(:dishes) { [dish_eggs, dish_sausages] }
  let(:restaurant) { double :restaurant, list_dishes: dishes }
  subject(:order) { described_class.new(restaurant) }

  it 'can give us a menu of dishes with prices' do
    expect(order.list_dishes).to eq dishes
  end

  describe "#add" do
    it "can add a dish to the order" do
      expect(restaurant).to receive(:dish).with("Eggs")
      order.add("Eggs")
    end

    it "can add a dish multiple times" do
      expect(restaurant).to receive(:dish).with("Eggs").exactly(5).times
      order.add("Eggs",5)
    end
  end

  describe "#check" do

    before "adds 5 eggs and 3 sausages to the order" do
      allow(restaurant).to receive(:dish).with("Eggs").and_return(dish_eggs)
      allow(restaurant).to receive(:dish).with("Sausages").and_return(dish_sausages)
      order.add("Eggs",2)
      order.add("Sausages",1)
    end

    it "prints the order and checks the total is correct" do
      order_printed = "Eggs-3\nEggs-3\nSausages-4\nYour total is £10.\n"
      expect(order.check).to eq order_printed
    end
  end

  describe "#confirm" do

    before "adds 5 eggs and 3 sausages to the order" do
      allow(restaurant).to receive(:dish).with("Eggs").and_return(dish_eggs)
      allow(restaurant).to receive(:dish).with("Sausages").and_return(dish_sausages)
      order.add("Eggs",2)
      order.add("Sausages",1)
    end

    it "sends the order to the restaurant" do
      expect(restaurant).to receive(:confirm).with(dishes)
      order.confirm
    end
  end

end

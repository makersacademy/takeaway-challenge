require 'order'
require 'twilio-ruby'

describe Order do

  let(:dish_eggs) { double :eggs, name: "Eggs", price: 3 }
  let(:dish_sausages) { double :sausages, name: "Sausages", price: 4 }
  let(:dishes) { [dish_eggs, dish_sausages] }
  let(:restaurant) { double :restaurant, list_dishes: dishes }
  let(:twilio) { double :twilio }
  let(:order_no_text) { described_class.new(restaurant, twilio) }
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
      order_printed = "\nEggs - 3\nEggs - 3\nSausages - 4\nYour total is £10.\nIt will be delivered at #{Time.now + 60*60}"
      expect(order.check).to eq order_printed
    end
  end

  describe "#confirm" do

    before "adds 5 eggs and 3 sausages to the order" do
      allow(restaurant).to receive(:dish).with("Eggs").and_return(dish_eggs)
      allow(restaurant).to receive(:dish).with("Sausages").and_return(dish_sausages)
      order_no_text.add("Eggs",2)
      order_no_text.add("Sausages",1)
    end

    it "sends the order to the restaurant" do
      eggs_2_sausages_1 = [dish_eggs, dish_eggs, dish_sausages]
      allow(order_no_text).to receive(:send_text).and_return("Text sent")
      expect(restaurant).to receive(:confirm).with(eggs_2_sausages_1)
      order_no_text.confirm
    end
  end

end

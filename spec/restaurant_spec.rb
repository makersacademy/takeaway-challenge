require 'restaurant'

describe Restaurant do
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:message_sender) { MessageSender.new }
  let(:restaurant) { Restaurant.new(menu, message_sender) }
  let(:phone_num) { double :phone_num }
  describe '#initialize' do
      
    it "returns an instance of the Restaurant class" do
      expect(restaurant).to be_an_instance_of Restaurant
    end
  end

  describe '#get_menu' do

    it "responds_to get_menu" do
      expect(restaurant).to respond_to(:get_menu)
    end

    it 'calls print_menu' do
      expect(restaurant.menu).to receive(:print_menu)
      restaurant.get_menu
    end

  end

  describe '#take_order' do

    let(:dish_name) { double :dish_name }
    let(:dish_name) { "dish_name" }
    let(:dish) { "dish" }
    let(:quantity) { "quantity" }
    

    it "raises an error if dish_name is not on the menu" do
      menu.add_dish(Dish.new('pizza', 10))
      order.order_dish('hamburger')

      expect { restaurant.take_order(order) }.to raise_error("This dish does not exist") 
    end

    it "returns total price" do
      menu.add_dish(Dish.new('pasta', 10))
      order.order_dish('pasta', 2)
      expect(restaurant.take_order(order)).to eq(20)
    end 
  end

  describe "#confirm_order" do

    it "responds_to confirm_order" do
      expect(restaurant).to respond_to(:confirm_order).with(1).argument
    end

    it "sends a message" do
      expect(restaurant.message_sender).to receive(:send_message)
      restaurant.confirm_order(phone_num)

    end 
  end 
end

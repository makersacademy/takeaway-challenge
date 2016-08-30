require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  let(:dish_no)    { double :dish_no }
  let(:dish_name)  { double :dish_name }
  let(:dish_price) { double :dish_price }

  let(:dish_info)  { { dish_no:    dish_no,
                       dish_name:  dish_name,
                       dish_price: dish_price } }

  let(:meal)       { [dish_info, dish_info, dish_info] }

  let(:meal_sum)   { dish_info[:dish_price] +
                     dish_info[:dish_price] +
                     dish_info[:dish_price] }

  describe "#display_menu" do
    it "should display the dishes and prices" do
      expect(menu.display_menu).to eq menu::CHINESE_MENU
    end
  end

  describe "#select_dish" do
    it "should start with an empty meal array" do
      expect(subject.meal).to be_empty
    end

    it "should display dish and price when user selects a dish" do
      expect(subject.select_dish).to eq dish_info
    end

    it "should add selected dish to meal" do
      expect{ subject.select_dish }.to change{ meal.length }.by(1)
    end

    it "should create an array of dishes" do
      subject.select_dish
      subject.select_dish
      subject.select_dish
      expect(subject.meal).to eq meal
    end
  end

  describe "#order_meal" do
     #it "returns"
  end

  describe "#order_total" do
    it "should return sum of all dish_prices in @meal" do
      subject.select_dish
      subject.select_dish
      subject.select_dish
      expect(subject.order_total).to eq meal_sum
    end
  end

  describe "#order_meal" do
    it "should confrim meal has been ordered via SMS" do
      expect{ order_meal(:meal_sum) }.to eq :meal_sum
    end

  end

  describe "#send_SMS" do
    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_SMS).with("Thank you for your order: £10.51")
      subject.order_meal(10.51)
    end
  end
end

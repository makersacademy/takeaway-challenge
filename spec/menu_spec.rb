require 'menu'

describe Menu do
subject(:menu) { described_class.new}

    it "displays the menu" do
      expect(menu).to respond_to(:display_menu)
    end

    it "select some number of several dishes" do
      expect(menu).to respond_to(:select_dishes).with(2).arguments
    end
end
#   let(:dish_no)    { double :dish_no }
#   let(:dish_name)  { double :dish_name }
#   let(:dish_price) { double :dish_price }
#
#   let(:dish_info)  { { dish_no:    dish_no,
#                        dish_name:  dish_name,
#                        dish_price: dish_price } }
#
#   let(:meal)       { [dish_info, dish_info, dish_info] }
#
#   let(:meal_sum)   { dish_info[:dish_price] +
#                      dish_info[:dish_price] +
#                      dish_info[:dish_price] }
#
#   describe "is able to respond to" do
#     it "#display_menu" do
#       expect(subject).to respond_to(:display_menu)
#     end
#     it "#select_dish" do
#       expect(subject).to respond_to(:select_dish)
#     end
#     it "#order_meal" do
#       expect(subject).to respond_to(:order_meal)
#     end
#     it "#order_total" do
#       expect(subject).to respond_to(:order_total)
#     end
#   end
#
#   describe "#display_menu" do
#     it "shows the menu" do
#       expect(subject.display_menu).to eq described_class::CHINESE_MENU
#     end
#   end
#
#   describe "#select_dish" do
#     it "should start with an empty meal array" do
#       expect(subject.meal).to be_empty
#     end
#
#     it "should display dish and price when user selects a dish" do
#       expect(subject.select_dish).to eq dish_info
#     end
#
#     it "should add selected dish to meal" do
#       expect{ subject.select_dish }.to change{ meal.length }.by(1)
#     end
#
#     it "should create an array of dishes" do
#       subject.select_dish
#       subject.select_dish
#       subject.select_dish
#       expect(subject.meal).to eq meal
#     end
#   end
#
#   describe "#order_meal" do
#      #it "returns"
#   end
#
#   describe "#order_total" do
#     it "should return sum of all dish_prices in @meal" do
#       subject.select_dish
#       subject.select_dish
#       subject.select_dish
#       expect(subject.order_total).to eq meal_sum
#     end
#   end
# end

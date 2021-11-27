require 'customer'
require 'restaurant'

describe Customer do
  
  let(:customer) { described_class.new(restaurant_double, food_double) }
 
  let(:restaurant_double) { double(:Restaurant, menu: [
    { "Breadsticks" => 0.99 },
    { "Steak" => 23 },
    { "Lasagna" => 14 },
    { "Butter Chicken Rice" => 11 },
    { "Spaghetti" => 12 },
    { "Mango Sorbet" => 3 },
    { "BBQ Beef" => 18 },
    { "Stir Fry" => 14.50 },
    { "Salad" => 6.50 },
    { "Cocktail" => 4.50 }
])
  }  

  let(:food_double) { double() }
  
  describe '#show_menu' do
    it 'displays a list of dishes with prices' do
      expect(customer.show_menu[1]).to include "Steak"
    end
  end

  describe '#select_food' do
    it 'allows customers to select dishes from menu' do
      expect(customer.select_food(1,4,5)).to eq([{ "Steak" => 23 }, { "Spaghetti" => 12 }, { "Mango Sorbet" => 3 }])
    end
  end

  describe '#check_price' do 
    it 'checks that the customer is being charged the correct amount' do 
      customer.select_food(1,4,5)
      expect(customer.check_receipt).to eq "£38"
    end 
  end

  describe '#place_order' do
    it 'sends order request to restaurant' do
      expect(food_double).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before #{Time.new.strftime("%k:%M")}")
      customer.place_order
    end
  end
end

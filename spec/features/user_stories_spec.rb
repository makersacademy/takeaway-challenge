require 'restaurant'

describe 'User Stories' do

  subject(:restaurant) { Restaurant.new(menu,message) }
  let(:menu) { double(:menu, print_menu: "rice: £1.00", find_cost: 3.50) }
  let(:message) {double(:message, send_confirmation: "Thank you! Your order was placed and will be delivered before 18:52")}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context 'So a customer can decide to place an order' do

    it 'has a menu with dishes and price' do
      expect(restaurant.show_menu).to eq "rice: £1.00"
    end

  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'So a customer can add dishes to their basket' do

    it 'allows single dishes to be selected' do
      restaurant.order_dish(dish: "chicken",quantity: 2)
      expect(restaurant.order).to eq({"chicken" => 2})
    end

    it 'allows multiple dishes to be selected' do
      restaurant.order_dish(dish: "chicken",quantity: 2)
      restaurant.order_dish(dish: "Noodles",quantity: 4)
      expect(restaurant.order).to eq({"chicken" => 2, "Noodles" => 4})
    end

  end

  context 'So a customer can verify their order looks right' do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given,
    # matches the sum of the various dishes in my order
    before do
      restaurant.order_dish(dish: "Noodles",quantity: 4)
      restaurant.order_dish(dish: "chicken",quantity: 2)
    end

    it "they can check what's in their basket" do
      expect(restaurant.view_basket).to eq "Noodles x 4 = £14.00 chicken x 2 = £7.00"
    end

    it "they can see their total bill" do
      expect(restaurant.total).to eq "Total: £21.00"
    end
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as,
  # "Thank you! Your order was placed and will be delivered before 18:52"
  # after I have ordered

  describe 'A customer checkout their basket' do

      before do
          restaurant.order_dish(dish: "Noodles",quantity: 4)
      end

      context 'when they pay the correct amount' do

        it 'will generate a message confirming order' do
          sms = "Thank you! Your order was placed and will be delivered before 18:52"
          expect(restaurant.checkout(14.00)).to eq sms
        end

        xit 'will raise an error if the incorrect amount is paid' do
          expect{restaurant.checkout(15.00)}.to raise_error('Cannot place order: Incorrect amount entered. Please try again')
        end
      end

  end

end

require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new(menu,message) }
let(:menu) { double(:menu, print_menu: "rice: £1",find_cost: 3.50)}
let(:message) {double(:message, send_confirmation: "Thank you! Your order was placed and will be delivered before 18:52")}

  context 'So a customer can decide to place an order' do

    it 'has a menu containing dishes and price' do
      expect(restaurant.show_menu).to eq "rice: £1"
    end
  end

  context 'So a customer can add to their basket' do
    before do
      restaurant.order_dish(dish: "chicken",quantity: 2)
    end

    it 'allows single dishes to be placed' do
      expect(restaurant.order).to eq({"chicken" => 2})
    end

    it 'allows multiple dishes to be selected' do

      restaurant.order_dish(dish: "Noodles",quantity: 4)
      expect(restaurant.order).to eq({"chicken" => 2, "Noodles" => 4})
    end

  end

  context 'So a customer can verify their order looks right' do

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
        expect{restaurant.checkout(15.00)}.to raise_error 'Cannot place order: Incorrect amount entered. Please try again'
      end

    end

  end
end

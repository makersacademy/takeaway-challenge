require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new(menu) }
let(:menu) { double(:menu, print_menu: "rice: £1",find_cost: 3.55)}

  context 'So a customer can decide to place an order' do

    it 'has a menu containing dishes and price' do
      expect(restaurant.show_menu).to eq "rice: £1"
    end
  end

  context 'So a customer can add to their basket' do

    it 'allows single dishes to be placed' do
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

    before do
      restaurant.order_dish(dish: "Noodles",quantity: 4)
      restaurant.order_dish(dish: "chicken",quantity: 2)
    end

    it "they can check what's in their basket" do
      expect(restaurant.view_basket).to eq "Noodles x 4 = £14.20 chicken x 2 = £7.10"
    end

    it "they can see their total bill" do
      expect(restaurant.total).to eq "Total: £21.30"
    end

  end
end

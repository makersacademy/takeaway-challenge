require 'restaurant'

describe Restaurant do

  let(:restaurant) { described_class.new }
  let(:dish1) { double(:dish1, name: "Dishy1", price: 1.11) }
  let(:dish2) { double(:dish2, name: "Dishy2", price: 2.22) }
  let(:dish3) { double(:dish3, name: "Dishy3", price: 3.33) }
  let(:dish_decimal) { double(:dish4, name: "Dishy4", price: 5.00) }

  describe '#make_dish_available' do
    it 'adds a new dish to the menu' do
      restaurant.make_dish_available(dish1)
      expect(restaurant.menu.include?(dish1)).to be true
    end
  end

  describe '#view_menu' do
    it 'lists dishes available with price' do
      restaurant.make_dish_available(dish1)
      expected_output = "1: Dishy1 | Price: £1.11\n"
      expect(restaurant.view_menu).to eq expected_output
    end

    it 'lists multiple dishes with unique order numbers' do
      restaurant.make_dish_available(dish1)
      restaurant.make_dish_available(dish2)
      restaurant.make_dish_available(dish3)
      expected_output = "1: Dishy1 | Price: £1.11\n" \
                        "2: Dishy2 | Price: £2.22\n" \
                        "3: Dishy3 | Price: £3.33\n"
      expect(restaurant.view_menu).to eq expected_output
    end

    it 'raises an error if no dishes available' do
      error_msg = "No dishes available on this menu"
      expect{ restaurant.view_menu }.to raise_error error_msg
    end

    it 'displays prices to 2 decimal places' do
      expected_output = "1: Dishy4 | Price: £5.00\n"
      restaurant.make_dish_available(dish_decimal)
      expect(restaurant.view_menu).to eq expected_output
    end
  end

  describe '#select' do
    it 'returns the selected dish given the corresponding menu number' do
      restaurant.make_dish_available(dish1)
      restaurant.make_dish_available(dish2)
      restaurant.make_dish_available(dish3)
      expect( restaurant.select(2) ).to eq dish2
    end

    it 'raises an error if no dishes have been added' do
      error_msg = "No dishes available on this menu"
      expect{ restaurant.select(1) }.to raise_error error_msg
    end

    it 'raises an error if order number isn\'t listed' do
      restaurant.make_dish_available(dish1)
      error_msg = "There are no dishes matching the number given"
      expect{ restaurant.select(2) }.to raise_error error_msg
    end
  end

end

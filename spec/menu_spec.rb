require 'menu'

describe Menu do

  let(:dish_one) {double :dish_one, name: "Chowmein", price: 5}
  let(:dish_two) {double :dish_two, name: "Fried rice", price: 5}
  let(:dish_three) {double :dish_three, name: "Prawn crackers", price: 5}
  let(:dish_output) {"Chowmein: £5"}
  let(:menu_output) {["1. Chowmein: £5", "2. Fried rice: £5"]}
  subject(:menu) {described_class.new}

  describe '.items' do

    it 'should add an item to the menu' do
      menu.add(dish_one)
      expect(menu.dishes).to include dish_one
    end

    it 'returns the details of a single dish' do
      menu.add(dish_one)
      expect(menu.print_dish(dish_one)).to eq dish_output
    end

    it 'returns the details of all dishes' do
      menu.add(dish_one)
      menu.add(dish_two)
      expect(menu.print_menu).to eq menu_output
    end

  end

end

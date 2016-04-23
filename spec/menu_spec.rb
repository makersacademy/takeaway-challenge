require 'menu'

describe Menu do
  subject(:menu) {described_class.new(dishes: [dish_tikka, dish_chow])}
  let(:dish_tikka){double(:dish_tikka, name: "Tikka Masala", price: 7)}
  let(:dish_chow){double(:dish_chow, name: "Chow Mein", price: 6)}
  let(:list_dishes) do
    [dish_tikka, dish_chow].each {|dish| puts"#{dish.name}: £#{dish.price}"}
  end

  describe '#show_menu' do
    it 'expected to show list of dishes and prices' do
      expect(menu.show_menu).to eq list_dishes
    end
  end
end

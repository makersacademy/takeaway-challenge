require 'menu'

describe Menu do
  subject(:menu) {described_class.new(dishes: [dish_tikka, dish_chow])}
  let(:dish_tikka){double(:dish_tikka, name: "Tikka Masala", price: 7.95)}
  let(:dish_chow){double(:dish_chow, name: "Chow Mein", price: 6.95)}
  let(:dish) {double :dish}
  let(:list_dishes) do
    [dish_tikka, dish_chow].each do |dish|
      puts format('%s: £%0.2f', dish.name, dish.price)
    end
  end

  describe '#show_menu' do
    it 'expected to show list of dishes and prices' do
      expect(menu.show_menu).to eq list_dishes
    end
  end

  describe '#includes dish' do
    context 'when dish on menu' do
      it 'expects to return true' do
        expect(menu.include_dish?(dish_tikka)).to eq true
      end
    end

    context 'when dish not available on menu' do
      it 'expects to return false' do
        expect(menu.include_dish?(dish)).to eq false
      end
    end
  end
end

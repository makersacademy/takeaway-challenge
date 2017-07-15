require 'menu'

describe Menu do
  dishes = {
    "Cheese & Tomato"   => 6.00,
    "Mighty Meaty"      => 9.00,
    "Pepperoni Passion" => 8.00,
    "Tandoori Hot"      => 9.00,
    "Vegi Sizzler"      => 8.00
  }
  subject(:menu) { described_class.new("Dominos", dishes) }

  describe 'initialization' do
    it 'has a name' do
      expect(menu.name).to eq "Dominos"
    end

    it 'has a list of dishes' do
      expect(menu.dishes.count).not_to be_zero
    end

    it 'has no dishes with zero price' do
      expect(menu.dishes.select { |_name, price| price == 0 }.count).to be_zero
    end
  end
end

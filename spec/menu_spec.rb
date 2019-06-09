require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { [{ dish: "Burger", price: 12 }, { dish: "Cheese Burger", price: 14 }] }


  describe 'show_menu' do
    it 'returns an array of all items' do
      expect(menu.show_menu).to eq dishes
    end
  end
end

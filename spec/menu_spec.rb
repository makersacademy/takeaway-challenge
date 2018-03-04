require 'menu'

describe Menu do
  subject(:menu) { described_class.new({ "Naan" => 1.00 }) }

  describe '#read_menu' do
    it 'displays menu with dishes and price' do
      expect(menu.read_menu).to eq({ "Naan" => 1.00 })
    end
  end

  describe '#price_of_dish' do
    it 'displays price of a selected dish' do
      expect(menu.price_of_dish("Naan")).to eq 1
    end
  end
end

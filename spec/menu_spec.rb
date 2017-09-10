require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it { is_expected.to respond_to(:list) }
  it { is_expected.to respond_to(:create_dish) }
  it { is_expected.to respond_to(:list_dishes) }

  describe '#create_dish' do
    it 'creates a new dish and adds it to the menu' do
      menu.create_dish("Pad thai", "Stir-fried rice noodle dish", 9)
      expect(menu.list).to eq [{ name: "Pad thai", description: "Stir-fried rice noodle dish", price: 9 }]
    end
  end

  describe '#list_dishes' do
    it 'lists dishes in the menu' do
      menu.create_dish("Pad thai", "Stir-fried rice noodle dish", 9)
      expect(menu.list_dishes).to eq ["Pad thai - Stir-fried rice noodle dish (£9)"]
    end

    it 'raises an error if the menu has no items available' do
      expect { menu.list_dishes }.to raise_error 'No dishes found'
    end

  end

end

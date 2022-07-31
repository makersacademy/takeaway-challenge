require 'menu'
require 'order'

MENU = <<~MENU.freeze
  1. Beef burger: 14
  2. Chicken burger: 12
  3. Hot dog: 11
  4. Fries: 4
  5. Soft drink: 3
  6. Milkshake: 5
MENU

describe Menu do
  subject (:menu) { Menu.new }
  
  describe '#view' do
    it { is_expected.to respond_to(:view) }

    specify { expect { menu.view }.to output(MENU).to_stdout }
  end

  describe '#select' do
    it { is_expected.to respond_to(:select).with(1).argument }

    it 'takes a dish' do
      expect(menu.select([1])).to be_an Order
    end

    it 'takes multiple dishes' do
      expect(menu.select([1, 4, 6])).to be_an Order
    end
  end
end

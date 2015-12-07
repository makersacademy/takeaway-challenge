require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }
  let(:price) { double :price }
    it { is_expected.to respond_to :list }

    describe '#add_menu_item' do
      it 'adds a new item to the menu list' do
        expect { menu.add_menu_item(dish, price) }.to change{menu.list.count}.by(1)
      end
    end
end

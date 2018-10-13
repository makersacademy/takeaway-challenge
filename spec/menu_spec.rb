require 'menu'

describe Menu do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }
  alt_menu = { "hotdog" => 2.00, "cake" => 2.50 }

  subject(:menu) { described_class.new }
  let(:non_default_menu) { described_class.new(alt_menu) }

  describe '#menu_items' do

    it { is_expected.to respond_to :menu_items }

    context 'initilized without a menu items paramater' do
      it 'Shows default menu items' do
        expect(menu.menu_items).to eq(default_menu)
      end
    end

    context 'initilized with a menu items paramater' do
      it 'Shows menu items passed at initilization' do
        expect(non_default_menu.menu_items).to eq(alt_menu)
      end
    end

  end
end

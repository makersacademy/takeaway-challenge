require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:non_default_menu) { described_class.new({ "hotdog" => 2.00, "cake" => 2.50 }) }

  describe '#menu_items' do

    it { is_expected.to respond_to :menu_items }

    context 'initilized without a menu items paramater' do
      it 'should show default menu items' do
        expect(menu.menu_items).to eq({ 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 })
      end
    end

    context 'initilized with a menu items paramater' do
      it 'should show menu items' do
        expect(non_default_menu.menu_items).to eq({ "hotdog" => 2.00, "cake" => 2.50 })
      end
    end

  end
end

require 'menu'

describe Menu do
  subject(:menu_obj) { described_class.new }
  let(:hash_keys){ [:dish, :price, :quantity]}
  it { is_expected.to respond_to :menu}

  describe 'show_menu' do
    it 'shows the menu' do
      expect(menu_obj.show_menu).to eq(menu_obj.menu)
    end
  end

  describe 'select_dishes' do
    it 'allows customers to select one of the available dishes' do
      menu_obj.show_menu
      expect(menu_obj.select_dishes)
      expect { menu_obj.select_dishes }.to change { menu_obj.ordered_dishes }
      #expect(menu_obj.ordered_dishes).to include(h.keys{dish:, price:, quantity:})
      menu_obj.ordered_dishes.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
    end
  end

end

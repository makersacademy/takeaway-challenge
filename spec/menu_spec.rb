require 'menu'

describe Menu do

  # it { is_expected.to respond_to(:display_menu) }
  describe '#display_menu' do
    it 'displays the menu' do
      menu = Menu.new
      expect(menu.display_menu).to eq("menu")
    end
  end

  it { is_expected.to respond_to(:select) }




end

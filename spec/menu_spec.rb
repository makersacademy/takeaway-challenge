require 'menu'

describe Menu do

  # it { is_expected.to respond_to(:display_menu) }
  describe '#display_menu' do
    it 'displays the menu' do
      menu = Menu.new
      expect(menu.display_menu).to eq(@menu)
    end
  end

  it { is_expected.to respond_to(:select).with(2).argument }

  describe '#select' do
    it 'selects the food items' do
      menu = Menu.new
      expect(menu.select("chips", 2)).to eq("You have added chips x2")
    end
  end

end

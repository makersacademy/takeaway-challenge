require 'menu'

describe Menu do

  # let(:menu){double(:menu)}
  # before(:each) {
  #   menu = Menu.new
  # }

  # it { is_expected.to respond_to(:display_menu) }
  describe '#display_menu' do
    it 'displays the menu' do
      menu = Menu.new
      expect(menu.display_menu).to eq(@menu)
    end
  end

  # it { is_expected.to respond_to(:select).with(2).argument }
  describe '#select' do
    it 'selects the food items' do
      menu = Menu.new
      expect(menu.select("chips", 2)).to eq("You have added chips x2 portions")
    end
  end

  # it { is_expected.to respond_to(:summary) }
  describe '#summary' do
    it 'displays the order basket so far' do
      menu = Menu.new
      menu.select("chips", 2)
      menu.select("kebab", 3)
      expect(menu.summary).to eq([{ "chips" => 2 }, { "kebab" => 3 }])
    end
  end

end

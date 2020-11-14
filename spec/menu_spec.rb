require 'menu'

describe Menu do

  let(:menu) { described_class.new }
  let(:dish) do { dosa: 5, pizza: 4.50 } end


  describe '#initialize' do
    it 'starts with a list of dishes with their prices' do
      # expect(menu).to respond_to(:new).with(1).argument
      expect(menu.menu).to eq Menu::MENU
    end
  end

  describe '#price_list' do
    it 'responds to the #price_list method' do
      expect(menu).to respond_to :price_list
    end

    it 'displays the list of dishes with their prices' do
      display_menu = "dosa £5.00, pizza £4.50"
      expect(menu.price_list).to eq(display_menu)
    end

  end
end

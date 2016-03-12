require 'menu'

describe Menu do

  # full_menu = Menu::MENU

  subject(:menu) { described_class.new }
  let(:dish1) { {name: 'sushi', amount: 3} }
  let(:dish2) { {name: 'ramen', amount: 1} }
  let(:dish1_with_price) { {name: 'sushi', amount: 3, price: 7} }
  let(:dish2_with_price) { {name: 'ramen', amount: 1, price: 12} }

  # describe '#initialize' do
  #   it '0.0 initializes an order with defalut menu' do
  # 
  #   end
  # end

  describe '#show_menu' do
    it '1.0 shows a list of dishes available to order with price' do
      expect(menu.show_menu).to include('sushi: £7' && 'ramen: £12')
    end
  end

  describe '#find_price' do
    it '2.0 finds a price of each dish and appends it to dish info' do
      expect(menu.find_price(dish1, dish2)).to include(dish1_with_price &&
                                                       dish2_with_price)
    end
  end
end

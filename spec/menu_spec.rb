require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  # instance variables:
  it { is_expected.to respond_to(:menu_list, :price_list, :dish_list) }
  # methods:
  it { is_expected.to respond_to(:print_menu, :load_menu, :prices) }

  describe '#load_menu' do
    it "menu_list is expected to have loaded data into it" do
      expect(menu.menu_list).not_to be_empty
    end
    it "price_list is expected to have loaded data into it" do
      expect(menu.price_list).not_to be_empty
    end
    it "dish_list is expected to have loaded data into it" do
      expect(menu.dish_list).not_to be_empty
    end
  end

  describe '#print_menu' do
    title = "Kiran's cafe menu:"
    it "is expected to return the menu list" do
      expect(menu.print_menu).to eq title + menu.menu_list.to_s
    end
  end
  describe '#prices' do
    it "is expected to return the price list" do
      expect(menu.prices).to eq menu.price_list
    end
  end
  describe '#dishes' do
    it "is expected to return the dish list" do
      expect(menu.dishes).to eq menu.dish_list
    end
  end
end
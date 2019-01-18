require 'menu'

describe Menu do

subject(:menu) { Menu.new }

  context 'list dish with price' do

    it "pizza 8, pasta 7, bread 2 " do
      result = Menu::DEFAULT_MENU
      expect(menu.list).to eq result
    end

  end
end

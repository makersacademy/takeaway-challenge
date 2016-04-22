require 'menu'
require "awesome_print"

describe Menu do
  subject(:menu) { described_class.new }

  context 'default key hash'  do
    it "expect to get message for non-found dish " do
      temp = menu.dishes["hola"]
      p "hash: #{menu.dishes["croquetas gato"]}"
      p "not found key #{temp}"
      expect(menu.dishes[:"bug-maker"]).to eq Menu::DISH_NOT_FOUND
    end
  end

  context '#get_dishes' do
    it 'returns the right size of hash' do
      expect(menu.dishes.size).to eq Menu::HASH_SIZE
    end
  end

  context 'provides the menu on screen' do
    before do
      list = ""
      menu.dishes.each do |k,v|
        list += "#{k} : €#{v}\n"
      end
      @message = "Bar El Gato Muerto"+"\n"+"MENU" +"\n" + list
    end
    it 'Mr. Waiter: menu, please!' do
      expect(menu.to_s).to eq @message
    end
  end
end
require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context 'default key hash'  do
    it "expect to get message for non-found dish " do
      temp = menu.dishes["no_esta"]
      expect(menu.dishes[:"bug-maker"]).to eq Menu::DEFAULT_VALUE
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

  context '#contains?' do
    it 'tortilla de patata is in the menu' do
      expect(menu.contains? "tortilla patata").to be true
    end

    it 'bug makers is not in the menu' do
      expect(menu.contains? "bug makers").to be false
    end
  end

  context '#price' do
    xit 'returns price of croquetas gato' do
    end

    xit 'returns default message for bug_makers' do
    end
  end
end
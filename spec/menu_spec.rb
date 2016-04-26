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

  context '#get_menu' do
    before do
      list = ""
      menu.dishes.each do |k,v|
        list += "#{k} : \t€#{v}\n"
      end
      @message = "Bar El Gato Muerto"+"\n"+"MENU" +"\n" + list
    end
    it 'provides menu on screen' do
      expect(menu.menu).to eq @message
    end

    it 'calls the to_s method' do
      expect(menu.to_s).to eq @message
    end
  end

  context '#contains?' do
    it 'tortilla de patata is in the menu' do
      expect(menu.contains?("tortilla patata")).to be true
    end

    it 'bug makers is not in the menu' do
      expect(menu.contains?("bug makers")).to be false
    end
  end

  context '#price' do
    it 'returns price of croquetas gato' do
      expect(menu.price("croquetas gato")).to eq 7.99
    end

    it 'returns default message for bug_makers' do
      expect(menu.price("bug makers")).to eq 0
    end
  end
end
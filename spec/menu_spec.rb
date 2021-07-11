require 'menu'

describe Menu do

  let(:subject) { Menu.new(nil)}

  describe '#initialize' do
    it 'initializes with the menu' do
      expect(subject.menu).to include('Chicken Tacos' => 6)
    end
  end 
  
  describe '#list_dishes' do
    it 'returns list of all dishes w/ prices' do
      expect(subject.menu).to eq Menu::THE_MENU
    end
  end
end
require './lib/menu'

describe Menu do

  let(:subject) { Menu.new(nil)}

  describe '#initialize' do
    it 'initializes with the menu' do
      expect(subject.menu).to include('Hallumi fritter burger' => 8)
    end
  end 
  
  describe '#list_dishes' do
    it 'returns list of all dishes prices' do
      expect(subject.menu).to eq Menu::MENU
    end
  end

end
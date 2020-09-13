require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  describe '#view menu' do
    it 'shows the menu' do
      expect(menu.view).to be_a(Hash)
    end
  end

  
end
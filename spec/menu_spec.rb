require 'menu'

  describe Menu do
    let(:menu)           { Menu.new }

    it 'can display menu items' do
      expect(menu.display).to eq(menu.items)  
    end
  end
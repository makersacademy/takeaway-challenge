require 'menu'

  describe Menu do
    let(:menu)           { Menu.new }

    it 'can display menu items' do
      expect(menu.display).to eq({"pasta" => 4.99, "bread" => 0.99, "rice" => 5.99})  
    end
  end
require 'menu'

describe Menu do

    it 'knows the menu exists' do
        menu = Menu.new
        expect(menu.dishes).to include({:dish=>"Lasagne", :price=>4.99})
    end

end

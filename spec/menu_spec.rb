require 'menu'

describe Menu do 

    it 'contains a menu with food and prices that can be read with the #menu method' do
    expect(subject.menu).to include({"Cheeseburger" => 3.15})
    end

end
        
            


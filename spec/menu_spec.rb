require 'menu'

describe Menu do 
    # using dependency injection to get the dishes in the menu
    # created a menu
    # then injecting a hash into the menu 
    subject(:menu) { described_class.new(dishes) } 

    let(:dishes) do 
        {
            "topokki" => 10, 
            "rice" => 5, 
            "Kimchi" => 5,  
            "Bibimbap" => 15
        }
    end 


    it 'contains a list of dishes with prices' do 
        expect(menu.dishes).to eq(dishes)
    end 

    it 'prints a list of dishes with their prices' do 
        get_menu  = "topokki = 10, rice = 5, Kimchi = 5, Bibimbap = 15"
        expect(menu.print_menu).to eq(get_menu)
    end 

end 
require 'takeaway' 
require 'menu'


describe Takeaway do 
    # describe '#dish' do 
    #     it 'lists the dishes with prices' do 
    #         takeaway = Takeaway.new
    #         expect(takeaway.dish).to include("topokki" => 10, "rice" => 5, "Kimchi" => 5,  "Bibimbap" => 15)
    #     end 
    # end 

    # describe '#selecting_meal and #ordering ' do 
    #     it 'customer can order meal from menu' do 
    #         takeaway = Takeaway.new 
    #         expect(takeaway.selecting_meal).to eq ('Thank you for your order, your total is :  ')
    #     end 
    # end 

    

   
    it 'lists the dishes with prices' do 
        menu = double("menu double ", :print_menu => {"topokki" => 10} )
        takeaway = Takeaway.new(menu)
        expect(takeaway.get_menu).to eq({"topokki" => 10} )

    end 


end  
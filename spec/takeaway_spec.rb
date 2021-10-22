require 'takeaway' 


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

    subject(:takeaway) { described_class.new(menu: menu) } #Injecting menu into the takeaway, so need to create a menu double. : is a symbol/ constant and it has a unquiue value

    #menu double 
    let(:menu) { double(:menu, print: double_menu) }
    let(:double_menu) { "topokki : £10 " }
    
    it 'lists the dishes with prices' do 
        expect(takeaway.get_menu).to eq(double_menu)

    end 


end  
require 'Takeaway'
require 'Menu'

describe Takeaway do   
    it "recieves the dishes hash from menu class on initialization" do
        #testing state over behaviour ##
        expect(subject.current_menu).to eq(subject.current_menu)
    end

    it "returns the menu of dishes from menu class (d_menu)" do
        expect(subject.d_menu).to eq({ "pizza" => 1, "pasta" => 2 })
    end

end

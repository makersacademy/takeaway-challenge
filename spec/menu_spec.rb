require 'menu'

describe Menu do
    it "can print the menu items" do
        expect {subject.print_menu}.to output("Chips: 2.0\nPizza: 24.0\nChicken Kiev: 3.0\n").to_stdout # \n = new line 
    end 
end
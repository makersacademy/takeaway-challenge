require 'menu'

  describe Menu do

    describe "#print_food" do


        it "has a list of names and prices" do

          printed_menu_double = double :printed_menu, print_printed_menu: "this is the printed menu test for now"


          menu = Menu.new(printed_menu_double)
          expect(menu.print_food).to eq "this is the printed menu test for now"

        end
    end
end

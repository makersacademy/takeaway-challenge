require 'menu'

  describe Menu do

    describe "#print_food" do


        it "has a list of names and prices" do

          printed_menu_double = double :printed_menu, print_printed_menu: { "Water" => 3, "Tea" => 4, "Coffee" => 2 }


          menu = Menu.new(printed_menu_double)
          expect(menu.print_food).to eq ({ "Water" => 3, "Tea" => 4, "Coffee" => 2 })

        end
    end
end

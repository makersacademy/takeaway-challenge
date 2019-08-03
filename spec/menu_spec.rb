require 'menu'

  describe Menu do

    describe "#print" do


        it "has a list of names and prices" do

          printed_menu_double = double :printed_menu


           menu = Menu.new(printed_menu_double)
          expect(menu.print).to eq("Water" => 3, "Tea" => 4, "Coffee" => 2)

        end
    end
end

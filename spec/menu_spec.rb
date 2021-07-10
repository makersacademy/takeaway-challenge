require "menu"
require "dish"


describe "Menu" do 
    describe "#initialize" do
        it "Creates a Menu Object with a name" do
            menu = Menu.new("Menu_July")
            expect(menu.menu_name).to eq "Menu_July"
        end

        it "Creates an empty array for the Menu" do
            menu = Menu.new("Menu_July")
            expect(menu.current_menu).to eq []
        end
    end

    describe "#add" do
        it "adds a dish to the current menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            expect(menu.current_menu).to eq [dish]
        end

        it "raises an error when dish already on the menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            expect { menu.add(dish) }.to raise_error "Dont add doubles to the Menu"
        end
    end

    describe "#remove" do
        it "removes dish from the current menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            menu.remove(dish)
            expect(menu.current_menu).to eq []
        end
    
        it "raises an error which the dish is not on the menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            expect { menu.remove(dish) }.to raise_error "Cant remove non-added Dish from Menu"
        end
    end

    describe "#view" do
        it "prints the whole Menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            expect { menu.view }.to output("1. Name: #{dish.name}, Price: #{dish.price}$\n").to_stdout
        end
    end

end
require './lib/menu.rb'

describe Menu do

    let(:dish1) { double(:name => 'Dish 1', :price => 10.00 )}
    let(:dish2) { double(:name => 'Dish 2', :price => 15.00 )}


    describe "#initialize" do
        it "should return a empty list on intialize" do
            expect(subject.menu_list).to be_empty
        end
    end

    describe "#add_dish" do

        it "should add a dish to the list" do
            subject.add_dish(dish1)
            expect(subject.menu_list).to include(dish1)
        end

        it "should return multiple dishes" do
            subject.add_dish(dish1)
            subject.add_dish(dish2)
            expect(subject.menu_list).to include(dish1, dish2)
        end
    end

    describe "#display_dishes" do

        it "should display a list of dishes" do
            subject.add_dish(dish1)
            subject.add_dish(dish2)
            expect{subject.display_dishes}.to output("1. Dish 1 - £10.0\n2. Dish 2 - £15.0\n").to_stdout
        end
    end


end
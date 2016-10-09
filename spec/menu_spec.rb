require 'menu'

describe Menu do

    describe "#initialize" do
      it "initialize with the current menu of dishes" do
        expect(subject.current_menu).to be_a_kind_of Array
      end
    end

    describe "#select_a_dish" do
      it "retrieves the ordered dish from the menu" do
        expect(subject.select_a_dish(111)).to eq({dish_category: 'Dessert:', dish_number: 111, dish: 'tart', price: 7})
      end
    end

    describe "#print_menu" do
      it "print the current menu onto the screen" do
        expect(subject.print_menu).to include({:dish_category=>"Drink:", :dish_number=>1112, :dish=>"wine", :price=>6})
      end
    end

  end

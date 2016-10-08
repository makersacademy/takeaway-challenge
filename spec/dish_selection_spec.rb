require 'dish_selection'

describe DishSelection do

  subject(:order) {described_class.new}

  describe " #show_food_menu displays food menu" do
    specify { expect { order.show_food_menu }.to output.to_stdout }
  end

  context "#select_dish" do
     before(:each) do
       @selection = [1]
       order.select_dish(@selection)
     end

    it " push the selected dish and price to order array" do
      expect(order.order).to include  order.food_menu[1]
    end
  end

end

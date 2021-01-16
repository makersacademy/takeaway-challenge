describe 'User Stories' do

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it 'allows you to add a new dish to the menu' do
        menu = Menu.new
        expect { menu.add(:dish) }.not_to raise_error
    end
    
    it '#1 - so I can see what to order, show me a list of dishes with prices' do
        menu = Menu.new
        dish1 = Dish.new('Ramen', 1.99)
        dish2 = Dish.new('Katsu', 2.49)
        menu.add(dish1)
        menu.add(dish2)
        menu.list
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    it '#2 - Allows you to order one or more dishes from the menu' do
        order = Order.new
        order.add(:dish)
    end

end
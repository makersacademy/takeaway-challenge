describe 'User Stories' do

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it '#1 - so I can see what to order, show me a list of dishes with prices' do
        menu = Menu.new
        menu.list
    end

    it 'allows you to add a new dish to the menu' do
        dish = Dish.new
        menu = Menu.new
        expect { menu.add(dish) }.not_to raise_error
    end

end
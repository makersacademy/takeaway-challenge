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
        menu.add('Ramen - £1.99')
        menu.add('Katsu - £2.49')
        menu.list
    end

end
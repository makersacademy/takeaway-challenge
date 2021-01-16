describe 'User Stories' do

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it 'so I can see what to order, show me a list of dishes with prices' do
        menu = Menu.new
        menu.list
    end

end
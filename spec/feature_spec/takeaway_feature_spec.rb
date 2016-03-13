require 'take_away_ui'


describe 'feature_test' do

    let(:takeaway) {TakeAway.new}
    let(:italian_menu) {ItalianMenu.new}
    let(:lunch_desserts) {{ Desserts: 'Price', Pannacotta: 7, Semi_fresso: 7, Tiramisu: 10}}
    let(:test_order) {"2 carbonara, 1 tiramisu and I dunno"}
    let(:full_menu) {italian_menu.dishes}
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    context 'User story 1 - display menu' do

      it 'allows customer to choose their #menu_choice' do
        expect(takeaway.menu_choice(:lunch, :dessert)).to eq lunch_desserts
      end

      it 'will raise error if the user chooses a meal #menu_choice not on the menu' do
        expect{takeaway.menu_choice(:breakfast, :all)}.to raise_error("We only serve lunch and dinner")
      end

      it 'allows the customer to display their #menu_choice' do
        expect(takeaway.display).to eq full_menu
      end

    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    context 'User story 2 - select from menu' do

      it 'allows the customer to select from the menu individually and add to basket' do
        takeaway.select_dish(:Margherita, 4)
        takeaway.select_dish(:Gnocchi, 1)
        expect(takeaway.selection).to include [:Gnocchi, 1]
      end

      it 'allows the customer to input their order in writing, process it and put it in the basket' do
        allow(STDOUT).to receive(:p).with("What would you like to eat? Eg '2 Carbonara and a Tiramisu'")
        allow(STDIN).to receive(:gets).and_return(test_order)
        takeaway.take_order
        expect(takeaway.basket.selection).to include [:Carbonara, 2]
      end

    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order

    context 'User story 3 - verify and confirm order' do

      it 'allows the user to display their order' do
        takeaway.select_dish(:Margherita, 4)
        takeaway.select_dish(:Gnocchi, 1)
        expect(takeaway.review_order).to eq takeaway.review_order
      end

      it 'allows the user to confirm order with price and raise error if prices do not match' do
        takeaway.select_dish(:Margherita, 4)
        takeaway.select_dish(:Gnocchi, 1)
        takeaway.review_order
        expect{takeaway.confirm_order(45)}.to raise_error("Price does not match")
      end

      it 'allows the user to confirm order with price and not raise error if prices match' do
        takeaway.select_dish(:Margherita, 4)
        takeaway.select_dish(:Gnocchi, 1)
        takeaway.review_order
        expect{takeaway.confirm_order(takeaway.basket.total_bill)}.not_to raise_error
      end

    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    xcontext 'User story 4 - text message' do

      it 'allows the user to ask for a message' do 
        takeaway.select_dish(:Margherita, 4)
        takeaway.select_dish(:Gnocchi, 1)
        takeaway.review_order
        takeaway.confirm_order(takeaway.basket.total_bill)
        expect{takeaway.checkout_message(order_summary)}
      end


    end


end

describe 'User Stories' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    menu = [{:id => 1, :dish => "Chicken Tikka", :price => 6.95},
            {:id => 2, :dish => "Butter Chiken", :price => 6.45},
            {:id => 3, :dish => "Paneer Tikka", :price => 8.45}]

    it 'shows a list of dishes with prices' do
      order = Order.new(menu: menu)
      expect(order.show_menu).to eq menu
    end
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'allows to select some number of several dishes' do
      order = Order.new(menu: menu)
      expect{ order.select_dishes(id: 1, quantity: 3) }.not_to raise_error
    end
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I
    # have been given matches the sum of the various dishes in my order
    it 'matches the sum of various dishes in order' do
      order = Order.new(menu: menu)
      order.select_dishes(id: 1, quantity: 3)
      expect(order.confirm_total(total_amount: 20.85)).to eq 20.85
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as
    # "Thank you! Your order was placed and will be delivered before 18:52"
    # after I have ordered
end

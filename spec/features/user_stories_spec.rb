describe 'user stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'so customers can place an order, they can view a menu with dishes and prices' do
    tas = TakeawayService.new
    menu = Menu.new
    expect { tas.view_menu }.to output(menu.view).to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'so customers can place an order, they can add multiple dishes with quantities to their order' do
    tas = TakeawayService.new
    tas.add_to_basket("Chicken", 2)
    tas.add_to_basket("Soup", 4)
    expect(tas.basket).to include({ "Chicken" => 2 }).and include({ "Soup" => 4 })
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "so customers can verify their order, instruct the takeaway service to show an order summary" do
    tas = TakeawayService.new
    tas.add_to_basket("Chicken", 2)
    tas.add_to_basket("Soup", 4)
    expect { tas.order_summary }.to_not raise_error
  end

  it "so customers can verify their order cost, instruct the takeaway service to show the total cost" do
    tas = TakeawayService.new
    tas.add_to_basket("Chicken", 2)
    tas.add_to_basket("Soup", 4)
    expect { tas.total_cost }.to_not raise_error
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  
end

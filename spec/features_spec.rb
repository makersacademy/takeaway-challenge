describe "TakeAway Challenge" do
  subject(:indian_resturant) {Resturant.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "Customer should be able to view a list of dishes and prices" do
    expect(indian_resturant.show_menu).to_not be_empty
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "Customer should be able to select dishes and quantity" do
    expect{indian_resturant.add_to_cart(name: :chicken_karahi, quantity: 1)}.to_not raise_error
    error_message = "Please provide a hash with ':name' and ':quantity' as keys"
    expect{indian_resturant.add_to_cart(name: :lamp_chops)}.to raise_error error_message
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "Customer can check that total given is sum of prices of dishes in his/her order" do
    indian_resturant.add_to_cart(name: :lamp_chops, quantity: 1)
    indian_resturant.add_to_cart(name: :naan, quantity: 2)
    expect(indian_resturant.confirm_order(12.9)).to eq "1. Lamp_chops\t1 Qty\t£7.0 EA\n2. Naan\t2 Qty\t£2.95 EA\nYour total is £12.90."
  end
end

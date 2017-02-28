describe "TakeAway Challenge" do
  let(:messenger_service) {spy(:messenger_service)}
  subject(:indian_resturant) {Resturant.new(Menu,Order,Printer, messenger_service)}

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
    expect{indian_resturant.add_to_cart(name: :lamb_chops)}.to raise_error error_message
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "Customer can check that total given is sum of prices of dishes in his/her order" do
    indian_resturant.add_to_cart(name: :lamb_chops, quantity: 1)
    indian_resturant.add_to_cart(name: :naan, quantity: 2)
    expect(indian_resturant.print_bill).to eq "1. Lamb_chops\t1 Qty\t£7.0 EA\n2. Naan\t2 Qty\t£2.95 EA\nYour total is £12.90."
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it "Customer receives an SMS when order is confirmed" do
    indian_resturant.add_to_cart(name: :lamb_chops, quantity: 1)
    indian_resturant.add_to_cart(name: :naan, quantity: 2)
    expect(messenger_service).to receive(:send_SMS).once
    indian_resturant.confirm_order(12.9)
  end

end

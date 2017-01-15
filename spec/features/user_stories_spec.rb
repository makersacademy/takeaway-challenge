describe "User stories" do
  subject (:takeaway) {TakeAway.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "so customers can view dishes, displays a menu showing available dishes and prices" do
    takeaway.menu.import_items
    expect{ takeaway.view_menu }.not_to raise_error
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "allows customers to add available dishes to their basket" do
    basket = Basket.new({"Cheese Pizza" => 5.99})
    expect { takeaway.order(item).not_to raise_error }
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "allows users to check that the total of the dishes matches the sum of the selected dishes" do
    expect {takeaway.view_total}.not_to raise_error
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and
  # will be delivered before 18:52" after I have ordered
  describe "confirming order and sending confirmation SMS" do
    before(:each) do
      allow(takeaway).to receive (:send_message)

      it "allows the user to place the order" do
        expect{takeaway.confirm_order}.not_to raise_error
      end

      it "sends a SMS message to the user confirming that their order has been placed and confirming the time it will be ready" do
        delivery_time = (Time.now + (60*60)).strftime("%H:%M")
        expect(takeaway).to receive(:send_message).with("Thank you! Your order was placed and will be delivered before #{delivery_time}")
        takeaway.confirm_order
      end
    end
  end
end

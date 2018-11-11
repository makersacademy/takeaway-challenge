describe 'user stories' do
  let(:kfc) { TakeAway.new("KFC") }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'should show the customer the menu' do
    expect { kfc.take_away_menu.display }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'should allow the customer to select a number of several dishes' do
    kfc.take_order("medium_chips", 2)
    expect { kfc.take_order("small_chips", 2) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "raises an error if the total doesn't match the sum of the dish prices" do
    kfc.take_order("medium_chips", 2)
    kfc.take_order("small_chips", 2)
    allow(kfc).to receive(:correct?) { false }
    expect { kfc.return_order }.to raise_error("Error: Sum did not match the total")
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it "confirms a text message was sent confirming the order" do
    expect(kfc.confirm_order).to eq "queued"
  end
end

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "so customers can place an order, they can see a list of dishes with prices" do
    takeaway= Takeaway.new
    takeaway.menu 
    expect { takeaway.menu }.not_to raise_error
  end
end
require 'takeaway'

feature 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "Prints a list of dishes with prices when person wants to order something" do
    takeaway = Takeaway.new
    expect(takeaway.list).to include("Kappa Maki => £8")
  end
end

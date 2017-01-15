require 'takeaway'

describe TakeAway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  subject(:takeaway) {described_class.new}


  describe "#read_menu" do
    it "checks if the menu can be read" do
    expect(takeaway).to respond_to(:read_menu)
  end
  end
end

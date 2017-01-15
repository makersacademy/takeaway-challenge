require 'takeaway'

describe TakeAway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  subject(:takeaway) {described_class.new}


    it "reads the menu" do
      t = TakeAway.new
      expect(takeaway.menu).to eq MENU
    end

 
end

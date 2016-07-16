require "takeaway"

describe TakeAway do
  subject(:takeaway) {TakeAway.new}

  describe "#see_menu" do
    it "allows customer to see menu" do
      expect(takeaway).to respond_to(:see_menu)
    end
  end
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

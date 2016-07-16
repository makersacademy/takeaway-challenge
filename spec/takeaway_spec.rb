require "takeaway"

describe TakeAway do
  subject(:takeaway) {TakeAway.new}

  describe "#initialize" do
    it "begins with a menu" do
      expect(takeaway.menu).to_not be nil
    end
  end

  describe "#see_menu" do
    it "allows customer to see menu" do
      expect(takeaway).to respond_to(:see_menu)
    end

    it "displays the menu list" do
      expect(takeaway.see_menu).to eq takeaway.menu
    end
  end

end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

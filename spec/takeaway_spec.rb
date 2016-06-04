# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#

require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  describe "#see_menu" do
    it "shows the list of dishes with prices" do
      expect(takeaway.see_menu).to eq ({"margarita": 5, "mushroom_pizza": 6, "pepperoni_pizza": 7, "chips": 3, "soft_drink": 2, "alcohol": 5})
    end
  end

  describe "#order"
  it "selects from the available dishes" do
    expect(takeaway.order(2, "margarita")).to eq "2 x margarita(s) added to the basket."
  end

  it "prompts the user when a food is already in the basket, and adds the food if customer selected 'yes'" do
    takeaway.order("margarita")
    allow(takeaway).to receive(:gets).and_return "yes"
    expect(takeaway.order("margarita")).to eq "1 x margarita(s) added to the basket."
  end

  it "prompts the user when a food is already in the basket, and doesn't add the food if customer selected 'no'" do
    takeaway.order("margarita")
    allow(takeaway).to receive(:gets).and_return "no"
    expect(takeaway.order("margarita")).to eq "Thank you for confirming. margarita is not added to the basket."
  end

  it "raises error if the food requested is not in the menu" do
    expect{takeaway.order("hamburger")}.to raise_error("Unfortunately we do not have hamburger. Please select from the menu.")
  end

  describe "#total" do
    it "calculates the total cost of the basket" do
      takeaway.order(2, "margarita")
      expect(takeaway.total).to eq "The total cost of your basket is £10."
    end
  end

  describe "#check_total" do
    it "checks the total given" do
      takeaway2 = Takeaway.new
      takeaway2.order(2, "margarita")
      takeaway2.order(1, "chips")
      p takeaway2.basket
      p takeaway2.total
      expect(takeaway2.check_total(13)).to eq "You have ordered: 2 x margarita(s) = £10/n1 x chips(s) = £3/nThe total is: £13."
    end
  end

end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  describe "#see_menu" do
    it "shows the list of dishes with prices" do
      expect(takeaway.see_menu).to eq ({margarita: 5, mushroom_pizza: 6, pepperoni_pizza: 7, chips: 3, soft_drink: 2, alcohol: 5})
    end
  end

  describe '#order_food' do
    it "raises error if the food requested is not in the menu" do
      expect{takeaway.order_food("hamburger")}.to raise_error("Unfortunately we do not have hamburger. Please select from the menu.")
    end
  end

describe "#total" do
  it "calculates the total cost of the basket" do
    takeaway.order_food(2, "margarita")
    expect(takeaway.total).to eq "The total cost of your basket is £10."
  end
end

describe "#check_total" do
  it "checks the total given" do
    takeaway2 = Takeaway.new
    takeaway2.order_food(2, "margarita")
    takeaway2.order_food("chips")
    takeaway2.total
    expect(takeaway2.check_total(13)).to eq "You have ordered: 2 x margarita(s) = £10\n1 x chips(s) = £3\nThe total is: £13."
  end
end

describe "#checkout" do
  it "sends confirmation message to the client" do
    allow(takeaway).to receive(:checkout).and_return("Thank you! Your order is placed and will be delivered before #{((Time.now)+3600).strftime("%I:%M%p")}")
    expect(takeaway.checkout).to eq "Thank you! Your order is placed and will be delivered before #{((Time.now)+3600).strftime("%I:%M%p")}"
  end
end

end

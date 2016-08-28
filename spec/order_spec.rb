require 'order'

describe Order do

	subject(:new_order) {described_class.new}

	describe "#order" do
	  it "selects from the available dishes" do
	    expect(new_order.select_food(2, "margarita")).to eq "2 x margarita(s) added to the basket."
	  end

	  it "prompts the user when a food is already in the basket, and adds the food if customer selected 'yes'" do
	    new_order.select_food("margarita")
	    allow(new_order).to receive(:gets).and_return "yes"
	    expect(new_order.select_food("margarita")).to eq "1 x margarita(s) added to the basket."
	  end

	  it "prompts the user when a food is already in the basket, and doesn't add the food if customer selected 'no'" do
	    new_order.select_food("margarita")
	    allow(new_order).to receive(:gets).and_return "no"
	    expect(new_order.select_food("margarita")).to eq "Thank you for confirming. Margarita is not added to the basket."
	  end

	end

end

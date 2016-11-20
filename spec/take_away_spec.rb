
require "take_away"

describe TakeAway do
  subject(:take_away) {described_class.new(Order,SMS)}

  context "when #menu it" do
    it "should display a list of dishes with prices" do
      expect(take_away.menu).to eq ({chicken: 5, beef: 6, pork: 7})
    end
  end

  context "when #add_to_basket it" do
    it "should output a message with the added items" do
      expect(take_away.add_to_basket("chicken",5)).to eq "You added 5 x chicken to the basket."
    end
  end
    context "when #check_price it" do
      it "should verify the given value against the total price of the dishes added to basket" do
        take_away.add_to_basket("chicken",5)
        take_away.add_to_basket("pork",5)
        expect(take_away.check_price(60)).to eq true
      end
    end
    context "when #checkout it" do
      before do
        allow(take_away).to receive(:send_message).and_return "Your order will arrive at 17:22."
      end
      it "should raise an error if the price introduced is not the same as the total price of the dishes" do
        take_away.add_to_basket("chicken",5)
        expect{take_away.checkout(26)}.to raise_error "The price doesn't match: enter the correct value."
      end
      it "should not raise an error if the prices match" do
        take_away.add_to_basket("chicken",5)
        expect{take_away.checkout(25)}.to_not raise_error
      end
      it "should send an confirmation message" do
        take_away.add_to_basket("chicken",5)
        expect(take_away.checkout(25)).to eq "Your order will arrive at 17:22."
      end
    end

end


require "take_away"

describe TakeAway do
  subject(:take_away) {described_class.new}

  context "when #menu it" do
    it "should respond to menu" do
      expect(take_away).to respond_to(:menu)
    end
    it "should display a list of dishes with prices" do
      expect(take_away.menu).to eq [{chicken: 5}, {beef: 6}, {pork: 7}]
    end
  end
end

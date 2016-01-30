require 'takeaway'

describe TakeAway do
  subject(:take_away) {described_class.new}
  
  describe "#menu" do
    it "can read menu" do
      expect(take_away.read_menu).to include "Egg Fried Rice"
    end
  end
end
require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  describe "#initialize" do
    it "has a menu object" do
      expect(take_away.menu).to be_a(Object)
    end
    it "has a hash for basket" do
      expect(take_away.basket).to be_a(Hash)
    end
  end
end

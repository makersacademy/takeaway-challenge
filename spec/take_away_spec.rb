require 'take_away'

describe TakeAway do

  let(:menu) { double :menu, 'foo' => 1.99 }
  subject(:take_away) { described_class.new }

  describe "#initialize" do
    it "has a menu object" do
      expect(take_away.menu).to be_a(Object)
      p menu
    end
    it "has a hash for basket" do
      expect(take_away.basket).to be_a(Hash)
    end
  end

  describe "#read_menu" do
    it "displays contents of menu in a hash" do
      expect(take_away.read_menu).to be_a(Hash)
    end
  end
end

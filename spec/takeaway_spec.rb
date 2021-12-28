require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  describe "#display_menu" do
    it "displays the menu" do
      expect(takeaway.display_menu).to eq({Soup: 2, Bread: 1})
    end
  end
end
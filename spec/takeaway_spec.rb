require 'takeaway'


describe Takeaway do

  describe "#view_menu" do

    let(:takeaway) { described_class.new }

    it "allows us to view a menu" do
      expect(takeaway.view_menu).to eq("Pizza £7.50, Burger £6.50, Pasta £5.00")
    end
  end
end

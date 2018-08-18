require 'takeaway'

describe Takeaway do

  describe "#view_menu" do

    let(:takeaway) { described_class.new(menu: menu) }
    let(:menu) { double(:menu) }

    it "responds to this method" do
      expect(takeaway).to respond_to(:view_menu)
    end

    it "allows us to view a menu" do
      expect(takeaway.view_menu).to eq("Pizza: £7.50")
    end
  end


end

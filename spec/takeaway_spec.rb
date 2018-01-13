require "takeaway"

describe Takeaway do

  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }

  describe "menu" do

    it "can check the menu" do
      expect(takeaway.menu).to eq menu
    end
  end
end

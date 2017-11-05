require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
    describe "#menu" do
      context "when requesting to see the menu" do
        it "should show the menu" do
          expect(takeaway.menu).to eq menu
        end
      end
    end
end

require "takeaway"

describe TakeAway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu) }

  describe "#read_menu" do
    it "should display the menu" do
      expect(menu).to receive(:display)
      subject.read_menu
    end
  end
end

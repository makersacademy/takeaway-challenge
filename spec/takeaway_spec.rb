require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, check_total: true }
  let(:menu_class) { double :menu_class, new: menu }
  subject {described_class.new(menu_class)}
  
  describe "#place_order" do
    it "checks the total with the menu" do
      expect(menu).to receive(:check_total)
      subject.place_order
    end
  end

end
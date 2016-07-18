require 'menu'

describe Menu do
  it "returns the menu" do
    expect(subject.show_menu).to include "Fat-Free Butter"
  end
  describe '#make_an_order' do
    it "Starts the ordering process after customer confirmation" do
      expect(subject.make_an_order('yes')).to be_an Order
    end
    it "Start over again if confirmation is denied" do
      expect(subject.make_an_order('no')).to be_a Takeaway
    end
  end
end

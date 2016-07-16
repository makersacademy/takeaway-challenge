require 'menu'

describe Menu do
  it "returns the menu" do
    expect(subject.menu).to include "Banana Smoothie"
  end
  describe '#make_an_order' do
    it "Starts the ordering process after customer confirmation" do
      expect(subject.make_an_order('yes')).to eq subject.order
    end
    it "Goes back to the restaurant list is confirmation is denied" do
      expect(subject.make_an_order('no')).to eq subject.takeaway
    end
  end
end

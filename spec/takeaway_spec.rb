require 'takeaway'

describe Takeaway do

  let(:menu) { double("menu") }
  let(:order) { double("order") }

  subject { described_class.new(:menu, :order) }

  it "has a menu" do
    expect(subject.menu).to eq(:menu)
  end

  it "has an order" do
    expect(subject.order).to eq(:order)
  end

  describe "#view_menu" do
    it "returns @menu.view" do
      expect(menu).to receive(:view)
      subject.view_menu
    end
  end

end

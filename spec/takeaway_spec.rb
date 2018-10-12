require "takeaway"

describe Takeaway do

  subject { Takeaway.new(menu) }
  let(:menu) { double :menu, items: [{dish: "burger", price: 4}] }

  describe '#show_menu' do

    it "should show dishes and prices" do
      expect(menu).to receive(:items)
      subject.show_menu
    end

  end

end

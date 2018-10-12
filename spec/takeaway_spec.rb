require "takeaway"

describe Takeaway do

  subject { Takeaway.new(menu, format) }
  let(:menu) { double :menu, items: [{dish: "burger", price: 4}] }
  let(:format) { double :format, format_menu: "Burger - £4.00"}

  describe '#show_menu' do

    it "should show dishes and prices" do
      expect(format).to receive(:format_menu)
      expect(menu).to receive(:items)
      subject.show_menu
    end

  end

end

require './lib/order'

describe Order do
 # let(:menu) {[{item: 5, name: "rice", price: 10}]}
 # @menu.instance_variable_set(:@menu, 5)
  describe '#select' do
    it "raises an error if the item does not exist" do
      expect{subject.select(8)}.to raise_error("dish does not exist")
    end

    it "stores the selected items in @current_order" do
      subject.select(1)
      expect(subject.select(2)).to eq([1,2])
    end
  end

  describe '#calc_tot' do
    it "calculates the total of an order" do
      subject.select(1)
      subject.select(2)
      expect(subject.calc_tot).to eq(20.5)
    end
  end

  describe '#send_notification' do
    it "returns current time +1" do
      expect(subject.send_notification).to include("Thank you")
    end
  end


end
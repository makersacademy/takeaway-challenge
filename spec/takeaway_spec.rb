require "takeaway"
describe Takeaway do
  let(:my_menu) { double("Tapas", ready?: true, dish: "Pinchitos", price: 6.99) }
  subject { described_class.new (my_menu) }
  
  describe "#my_order method" do
    it "expect menu to do 4 actions" do
      expect(my_menu).to receive(:ready?)
      expect(my_menu).to receive(:dish)
      expect(my_menu).to receive(:price)
      expect(my_menu).to receive(:order)
      subject.my_order
    end
  end 
end

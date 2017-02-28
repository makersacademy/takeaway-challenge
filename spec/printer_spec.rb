require 'printer'

describe Printer do
  subject(:printer) {Printer.new}
  let(:order_details) {[{:name=>:lamp_chops, :price=>7.0, :quantity=>1}, {:name=>:naan, :price=>2.95, :quantity=>2}]}

  context "#display_bill" do
    it "takes the order details and total and prints the bill" do
      expect(subject).to receive(:display_bill).with(duck_type(:map),duck_type(:+))
      printer.display_bill(order_details, 15)
    end
  end

end

require 'printer'

describe Printer do
  let(:printer) {Printer.new}
  let(:curry) {double :dish, name: 'Curry', price: 8}
  let(:rice) {double :dish, name: 'Rice', price: 3}
  let(:basket) {double :basket, total_price: 19, dishes: {curry => 2, rice => 1}}

  describe "#print" do
    it "can print a dish" do
      expect{printer.print_dish(curry)}.to output(/Curry - £8/).to_stdout
    end
    it "can print a total" do
      expect{printer.print_total(basket)}.to output(/Total Price: £19/).to_stdout
    end
    it "can print a basket summary" do
      expect(printer).to receive(:print_dish).with(curry).twice
      expect(printer).to receive(:print_dish).with(rice).once
      expect(printer).to receive(:print_total).with(basket).once
      printer.print_basket(basket)
    end
  end
end
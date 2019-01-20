require 'menuprinter'
describe MenuPrinter do
  let(:takeaway) { double(:takeaway, items: [ {name: "Chips", price: 2}, {name: "Curry", price: 3.25 } ]) }

  describe "#print_items" do
    it "outputs formatted items to stdout" do
      expect { subject.print_items(takeaway.items) }.to output("1. Chips: £2.00\n2. Curry: £3.25").to_stdout
    end
  end
end

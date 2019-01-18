require 'display'
describe Printer do
  let(:chips) {{name: 'chips', price: 2}}
  let(:curry) {{name: 'curry', price: 3.25}}
  let(:takeaway) {double(:takeaway, items: [chips, curry])}
  describe "#format_items" do
    it "formats items to be human readable" do
      expect(subject.format_items(takeaway.items)).to eq "1. Chips: £2.00\n2. Curry: £3.25"
    end
  end
  describe "#print_items" do
    it "outputs formatted items to stdout" do
      expect{subject.print_items(takeaway.items)}.to output("1. Chips: £2.00\n2. Curry: £3.25").to_stdout
    end
  end
end

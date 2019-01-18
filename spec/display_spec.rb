require 'display'
describe Display do
  let(:chips) {{name: 'chips', price: 2}}
  let(:curry) {{name: 'curry', price: 3.25}}
  let(:takeaway) {double(:takeaway, items: [chips, curry])}
  describe "#print items" do
    it "formats items to be human readable" do
      expect(subject.display_items(takeaway.items)).to eq "1. Chips: £2.00\n2. Curry: £3.25"
    end
  end
end

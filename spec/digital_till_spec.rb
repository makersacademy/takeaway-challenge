require 'digital_till'

describe DigitalTill do

  let(:order) { [{ quantity: 2, item: "pizza", cost: 12 }, { quantity: 1,
    item: "burger", cost: 5 }]
  }
  subject(:digital_till) { described_class.new(order) }

  describe '#verify_total' do
    it 'checks the total against the cost of items in the order' do
      expect(digital_till.verify_total(17)).to eq true
    end

    it 'will return false if the totals do not match' do
      expect(digital_till.verify_total(12)).to eq false
    end
  end

  describe '#itemised_receipt' do
    let(:expected_output) {
      ["\nRECEIPT:", "2 x Pizza - £12",
       "1 x Burger - £5", "TOTAL - £17\n"].join("\n")
    }
    it 'viewing the receipt displays the items, quantities, prices and total' do
      expect(digital_till.itemised_receipt).to eq expected_output
    end
  end
end

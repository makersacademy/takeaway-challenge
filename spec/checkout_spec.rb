require 'checkout'

describe Checkout do
  let(:basket) { double :basket, current_order: [{ 'Test' => 1.5 },
    { 'Test' => 1.5 }, { 'another' => 4 }], total_cost: 7
  }

  context 'completing order' do

    it '#summarise_order' do
      checkout = described_class.new(basket)
      test_hash = { { "Test" => 1.5 } => 2, { "another" => 4 } => 1 }
      expect(checkout.summarised_order).to eq test_hash
    end
    it 'makes it look nice' do
      checkout = described_class.new(basket)
      test_array = ['-------------------------', "Your Order:",
      '-------------------------', "2x Test (£1.50)", "1x another (£4.00)",
      ['-------------------------', "Total: £7.00", '-------------------------']]
      expect(checkout.final_summary).to eq test_array
    end
  end

end

require 'summary'

describe Summary do

  let(:summary)          { described_class.new(final_choices) }
  let(:final_choices)    { [{ dish: "meat", quantity: 2 }] }
  let(:menu)             { { "meat" => 10, "veg" => 10 } }

  # test ok
  describe '#initialize' do
    it 'initializes with an array of final choices' do
      expect(summary.final_choices).to eq final_choices
    end
  end

  # test ok
  describe '#total' do
    it 'returns the total price for the final choices' do
      expect(summary.total(menu)).to eq 20
    end
  end

end

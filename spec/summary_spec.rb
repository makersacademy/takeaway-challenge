require 'summary'

describe Summary do

  let(:summary)          { described_class.new(final_choices) }
  let(:final_choices)    { ["meat", "veg"] }
  let(:menu)             { { "meat" => 10, "veg" => 10 } }

  describe '#initialize' do
    it 'initializes with an array of final choices' do
      expect(summary.final_choices).to eq final_choices
    end
  end

  describe '#total' do
    # test needs to be isolated from the Menu class (MENU constant)
    it 'returns the total price for the final choices' do
      expect(summary.total).to eq 15
    end
  end

end

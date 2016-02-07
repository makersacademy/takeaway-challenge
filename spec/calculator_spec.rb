require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }
  let(:takeaway) { double :takeaway }
  let(:menu) { {ribs: 3,
        beef: 4,
        rolls: 3,
        chips: 2,
        pies: 5}
  }
  let(:order) { { chips: 5, pies: 20} }
  

  describe '#calculate' do
    it 'calculates the bill' do
      allow(takeaway).to receive(:show_menu).and_return(menu)
      expect(calculator.calculate(order, takeaway)).to eq 110
    end
  end

end
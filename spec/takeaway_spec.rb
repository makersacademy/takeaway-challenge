require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:order).with(2).argument}

  describe '#order' do
    it 'stores quantity, dishname and dishprice' do
      dish = "Bratwurst in a bun"
      price = 2.49
      takeaway.order(2,dish)
      expect(takeaway.basket).to eq [2,dish,price]
    end
  end



  # it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:total) }

end

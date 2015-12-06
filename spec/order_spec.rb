require 'order.rb'

describe Order do
  subject(:order) { described_class.new({ 'katsu wrap' => 4.50, 'tikki masala' => 5.00 }) }
  let(:menu)      { double(:menu)       }

  it 'initialize with empty hash as current order' do
    expect(order.current).to eq({})
  end

  it 'let users check that their total correctly sums up all of the dishes in their order' do
    expect(order.total).to eq "total: 0"
  end

  it 'adds up price of each selection and stores it in the @total attribute of order' do
    order.current= {"katsu wrap"=>3}
    expect(order.total).to eq "total: 13.5"
  end

  it 'allow customers to place order by passing current dishes/quantities and expected total' do
    order.current= {"katsu wrap"=>3}
    expect{ order.place_order(order.current, 14) }.to raise_error"Sorry mate- but your total is actually 13.5"
  end

  describe '#choose' do
    it 'allows users to add any amount of dishes to their orders' do
      expect(order.choose('katsu wrap', 2)).to eq order.current
    end
    it 'does not allow customers to order things that are not in the options' do
      expect{ order.choose('something', 3) }.to raise_error'Sorry mate- something is not on the menu!'
    end
  end
end

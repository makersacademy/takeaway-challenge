require 'order.rb'

describe Order do
  subject(:order) { described_class.new({ 'beef-chuck brisket sub' => 4.50, 'pastrami salami sub' => 5.00 }) }
  let(:menu)      { double(:menu)       }


  it 'initialize with empty hash as current order' do
    expect(order.current).to eq({})
  end

  it 'let users check that their total correctly sums up all of the dishes in their order' do
    expect(order.total).to eq "Your total is: £0.00."
  end

  it 'adds up price of each selection and stores it in the @total attribute of order' do
    order.current= {"beef-chuck brisket sub"=>3}
    expect(order.total).to eq "3 beef-chuck brisket subs at £4.50 each.\nYour total is: £13.50."
  end

  describe '#choose' do
    it 'allows users to add any amount of dishes to their orders' do
      expect(order.choose('beef-chuck brisket sub', 2)).to eq order.current
    end
    it 'does not allow customers to order things that are not in the options' do
      expect{ order.choose('something', 3) }.to raise_error'Sorry mate- something is not on the menu!'
    end
  end
  describe '#place_order' do
    it 'sends text if user expects correct total' do
      expect(order.twil).to respond_to(:confirmation_text).with(1).argument
    end

    it "raises error if the user's expected total does not match the actual total" do
      order.current= {"beef-chuck brisket sub"=>3}
      expect{ order.place_order(order.current, 14) }.to raise_error"Sorry mate- but your total is actually 13.5"
    end
  end
end

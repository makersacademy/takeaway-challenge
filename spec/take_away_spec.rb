require 'take_away'

describe TakeAway do

  let(:menu) { double :menu }

  subject(:take_away) { described_class.new(menu) }

  it 'intialize with menu' do
    expect(TakeAway).to respond_to(:new).with(1)
  end

  it '#print_menu return list of dishes with price' do
    allow(menu).to receive(:pretty_print).and_return([{ pizza: 12 }, { burger: 8 }])
    expect(take_away.print_menu).to eq([{ pizza: 12 }, { burger: 8 }])
  end

end

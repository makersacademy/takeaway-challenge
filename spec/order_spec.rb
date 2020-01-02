require 'order'

describe Order do
  let(:basket) { double(:basket, :basket => [{ bufala: 10 }, { bufala: 10 }, { bufala: 10 }]) }

  it 'should calculate the total from the basket' do
    expect(subject.total(basket)).to eq 30
  end
end

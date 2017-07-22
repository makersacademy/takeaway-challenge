

describe Basket do

  subject(:basket) {described_class.new}

  it 'prints the title of the order' do
    expect(basket.to_s).to eq "You ordered:"
  end





end

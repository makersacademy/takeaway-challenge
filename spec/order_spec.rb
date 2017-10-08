require 'order'

describe Order do

  let(:basket) { double(:basket) }
  let(:dishes) { double(:dishes) }

  it 'checks the price is correct' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    total_price = 14.5
    expect(subject.correct_total_price?(total_price, prices_and_quantities_in_basket)).to eq true
  end
end

require 'order'

describe Order do
  it 'checks the price is correct' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    total_price = 14.5
    expect(subject.correct_total_price?(total_price, prices_and_quantities_in_basket)).to eq true
  end

  it 'allows you to place an order' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    total_price = 14.5
    subject.correct_total_price?(total_price, prices_and_quantities_in_basket)
    expect(subject.place_order).to eq "Thanks! Your order is placed and will be delivered."
  end
end

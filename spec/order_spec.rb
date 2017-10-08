require 'order'

describe Order do
  it 'checks the price is correct' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    total_price = 14.5
    expect(subject.correct_total_price?(total_price, prices_and_quantities_in_basket)).to eq true
  end

  it 'allows you to place an order' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    items_and_quantities = ({chicken_bhuna: 2, pilau_rice: 1})
    total_price = 14.5
    subject.correct_total_price?(total_price, prices_and_quantities_in_basket)
    expect(subject.place_order(items_and_quantities, total_price)).to eq "Thanks! Your order is placed and will be delivered."
  end

  it 'correctly records the meal order' do
    prices_and_quantities_in_basket = ({4.25 => 2, 2 => 3})
    items_and_quantities = ({chicken_bhuna: 2, pilau_rice: 1})
    total_price = 14.5
    subject.correct_total_price?(total_price, prices_and_quantities_in_basket)
    subject.place_order(items_and_quantities, total_price)
    expect(subject.meal_order).to eq ([{chicken_bhuna: 2, pilau_rice: 1}, 14.5])
  end
end

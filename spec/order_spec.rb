require 'order'

describe Order do
  it '#choose_order allows choosing dishes' do
    expect(
      subject.choose_order(1)
    ).to include(dish: 'Fish and chips', price: 8)
end

  it '#choose_order allows choosing the quantity of each dish' do
    array = [
      {dish: 'Fish and chips', price: 8},
      {dish: 'Fish and chips', price: 8},
      {dish: 'Fish and chips', price: 8}]
    expect(
      subject.choose_order(1, 3)
    ).to match_array(array)
  end

  it '#total returns cost of order' do
    subject.choose_order(1, 3)
    expect(subject.total).to eq(24)
  end


end

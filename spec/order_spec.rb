require 'order'

describe Order do
  let(:order) {described_class.new}
  let(:ordered_items){{"Dal Tadka" =>1,"Rice" =>1,"Naan" =>1}}
  let(:total) {9.50}

  it 'calculates the price of ordered items' do
    expect(order.calc_price(ordered_items)).to eq (total)
  end

end

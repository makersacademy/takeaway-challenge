require 'order'

describe Order do
  it 'selects a dish and adds it to the order list' do
    dish = double(:dish)
    menu = double(:menu)
    subject.select(dish)
    expect(subject.order_list).to eq [dish,dish]
  end
end
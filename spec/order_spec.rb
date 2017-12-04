require 'order'

describe Order do
  subject(:order) { described_class.new([1], [3], 15) }
  let(:menu) { double(:my_order_menu, show_menu: [dish1, dish2]) }
  let(:dish1) { double(:my_dish1, item_id: 1, price: 5) }
  let(:dish2) { double(:my_dish2, item_id: 2, price: 7) }

  it 'translates initial order attribute into dish objects' do
    expect(order.translate(menu)).to eq [dish1]
  end

  it 'calculates if order is correct' do
    order.translate(menu)
    expect(order.correct?).to be true
  end

  it 'calculates/formats delivery time' do
    format_time = (order.time + 3600).strftime("%H:%M")
    expect(order.delivery_time).to eq format_time
  end

end

require 'order'
require 'menu'

describe Order do
  let(:menu){Menu.new('./lib/menu.csv').format_menu}
  subject(:order) {described_class.new(menu)}
  let(:restaurant){ Restaurant.new('El Sombrero')}


  it 'responds to #add_items with one arg' do
    expect(order).to respond_to(:add_items)
  end

  it 'adds items to the order' do
    item = "Enchiladas Verdes"
    order.add_items(item, 2)
    expect(order.order[0]).to include {{:dish=> item}}
  end

  it 'does not add requests for items not listed on the menu' do
    item = "Enchiladas"
    allow(order).to receive(:item_exists?){false}
    expect{ order.add_items(item, 2)}.to raise_error "We didn't recognise that, try again"
  end

  it 'responds to #display_order_summary' do
    expect(order).to respond_to(:display_order_summary)
  end

  it 'displays an order summary' do
    item = "Enchiladas Verdes" # //priced at 7.95 each
    quantity = 2
    order.add_items(item, quantity)
    expect(order.display_order_summary).to eq "Your total is: £15.90"
  end

  it 'the price calculation returns a number' do
    item = "Enchiladas Verdes"
    order.add_items(item, 2)
    expect(order.calculate_total).to be_a_kind_of Float
  end

end

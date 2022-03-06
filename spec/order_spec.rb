require 'order'

describe Order do

  let(:menu_double) { double(:menu_double, :view_menu => [{:cod => 8.25}]) }

  it 'should contain an empty order by default' do
    expect(subject.basket).to eq({})
  end

  it 'should be initialised with an optional menu' do
    order = Order.new(menu_double)
    expect(order.menu).to eq menu_double
  end

  it 'should allow a given number of items to be added to the b'

end
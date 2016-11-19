require 'order'

describe Order do
  subject(:order) {described_class.new(Menu)}

  it 'should test that checkout responds to display bill' do
    expect(order).to respond_to :display_bill
  end

  it 'should test that a new menu is returned when see menu is called' do
    expect(order.see_menu).to be_kind_of Menu
  end

context "orders and prices" do
  before do
    order.see_menu
  end

  it 'should test that ordering food returns food ordered' do
    expect(order.order_food(1,1)).to include {order1}
  end

  it 'should test that all items and prices ordered are returned' do
    expect(order.display_bill).to include {users_order}
  end

  it 'should test that the calculate price returns the total of the bill' do
    order.order_food(1,1)
    order.order_food(3,3)
    order.order_food(7,5)
    expect(order.calculate_price).to eq "The total cost is £53"
  end
end 
end

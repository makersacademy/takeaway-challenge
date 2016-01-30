
describe 'Feature test' do

  let(:name) {"Rufus"}
  let(:tel_no) {"1-800-EXAMPLE"}
  let(:message) {"Expected bill of $11, was charged $11"}
  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  let(:order_details) {[:orange, :noodles]}
  let(:invalid_details) {[:dog, :pie, :haggis]}
  let(:customer) {Customer.new name, tel_no}
  let(:restaurant) {Restaurant.new Menu, Order}
  let(:menu) {Menu.new items}

  before do
    restaurant.change_menu menu
    restaurant.place_order customer, order_details
  end

  it 'allows order to be placed and retrieved' do
    expect(customer.check_bill restaurant).to eq message
  end

end

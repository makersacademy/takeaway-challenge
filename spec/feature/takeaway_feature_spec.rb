
describe 'Feature test' do

  let(:name) {"Rufus"}
  let(:tel_no) {"1-800-EXAMPLE"}
  let(:message) {"Thank you for your custom. Your total is $11. Your order will be delivered at #{Time.now + 3600}"}
  let(:error) {"Sorry, we don't serve: dog, haggis. Order aborted."}
  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  let(:order_details) {[:orange, :noodles]}
  let(:invalid_details) {[:dog, :pie, :haggis]}
  let(:invalid_details) {[:dog, :pie, :haggis]}
  let(:customer) {Customer.new name, tel_no}
  let(:restaurant) {Restaurant.new Menu, Order}
  let(:menu) {Menu.new items}
  let(:menu2) {Menu.new items}

  before do
    restaurant.change_menu menu
    restaurant.place_order customer, order_details
  end

  it 'allows order to be placed and retrieved so that customer can check bill' do
    expect(restaurant.place_order(customer, order_details)).to eq message
  end

  it 'raises error when customer places invalid order' do
    restaurant.change_menu menu2
    expect{restaurant.place_order(customer, invalid_details)}.to raise_error error
  end

end

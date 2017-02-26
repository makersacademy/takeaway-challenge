require 'order'

  describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }
  let(:confirmation) { double(:confirmation)}


  before do
    order.select_order("Koreanbbq", 2)
  end

  it 'introduces a start function which presents the menu' do
    allow(menu).to receive(:introduction) {"Welcome to MA Takeaway. Please order from our tasty selection of dishes!"}
    allow(menu).to receive(:show_menu) {[nil, nil, nil, nil, nil]}
    allow(order).to receive(:start) {[nil, nil, nil, nil, nil]}
    expect(order.start).to eq([nil, nil, nil, nil, nil])
  end

  it 'should let a customer order any number of items' do
    expect(order.selection).to eq( {:Koreanbbq => 2} )
  end

  it 'should add the selection to the order' do
    expect(order.orders).to eq ([{ :Koreanbbq => 2 }])
  end

  it 'should get the price of each item in the order' do
    expect(order.get_price).to eq([{:Koreanbbq => 2}])
  end

  describe '#Calculating prices' do

  context '#Calculating price' do
  before do
    order.get_price
    order.calculate_price
  end

  it 'should display the total price' do
    expect(order.display_total_price).to eq("The total cost of your order is £20")
  end
  #
  # it 'should raise an error if the total is incorrect' do
  #   order.calculate_price * 2
  #   expect{ (order.display_total_price).to raise_error("Something has gone wrong, please try again")}
  # end

  it 'should keep a history of orders' do
    expect(order.total).to eq(20)
  end

  it 'should add the totals of the orders' do
    expect(order.total).to eq(20)
  end

  it 'should give the user an option to confirm' do
    expect(order.confirm_alert).to eq("The total order will be scheduled for delivery. Do you wish to continue?")
  end

  it 'should cancel the order if the user wishes to cancel' do
    expect{order.confirm("no")}.to raise_error "Your order was cancelled"
  end

end

end
end

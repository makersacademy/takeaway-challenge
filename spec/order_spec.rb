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
    allow(menu).to receive(:show_menu) {[0, 0, 0, 0, 0]}
    allow(order).to receive(:start) {[0, 0, 0, 0, 0]}
    expect(order.start).to eq([0, 0, 0, 0, 0])
  end

  it 'should let a customer order any number of items' do
    expect(order.selection).to eq( {:Koreanbbq => 2} )
  end

  it 'should add the selection to the order' do
    expect(order.orders).to eq ([{ :Koreanbbq => 2 }])
  end
end

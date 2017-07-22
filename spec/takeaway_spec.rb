

describe Takeaway do

  let(:menu) { double :menu, list: { "Pepperoni pizza" => "11.99" } }
  let(:item) { "Pepperoni pizza" }
  let(:quantity) { 2 }
  let(:price) { 11.99 }
  let(:order) { double :order }
  let(:amount) {23.98}

  subject(:takeaway) { described_class.new(order, menu) }


  it 'starts with an order' do
    expect(takeaway.order).not_to be_nil
  end

  it 'can print the menu' do
    expect(takeaway.view_menu).to eq menu.list
  end

  # it 'lets the customer add an item to their order' do
  #   expect(order).to receive(:add)
  # takeaway.add_item(item, quantity, price)
  # end

  it 'finalises the order with the total cost' do
    expect(order).to receive(:complete_order)
    takeaway.finalise_order
  end

  it 'takes the payment and checks it is correct' do
    allow(order).to receive(:add)
    allow(order).to receive(:complete_order)
    allow(order).to receive(:total).and_return(23.98)
    order.add(item, quantity, price)
    takeaway.finalise_order
    expect(takeaway.payment(amount)).to eq "Thank you for your payment!"
  end
end

require 'takeaway'
describe TakeAway do
  subject(:takeaway){ described_class.new(menu,order)}
  let(:order){double :order}
  let(:menu){double :menu, display_menu: {"Fried Rice" => 5.99,
    "Chicken Chow Mein" => 7.99, "Cheeseburger" => 6.99, "Pizza" => 8}}

  it 'shows the menu' do
    expect(takeaway.read_menu).to eq menu.display_menu
  end

  it 'confirms order added' do
    allow(order).to receive(:order_food).with(any_args)
    message = "2 order(s) of Fried Rice added to your cart"
    expect(takeaway.order_food("Fried Rice", 2)).to eq message
  end

  it 'confirms order' do
    current = Time.now
    t = "#{current.hour + 1}:#{'%02d' % current.min}"
    message = "Thank you! Your order was placed and will be delivered before #{t}"
    allow(order).to receive(:total).and_return(12.99)
    expect(takeaway.confirm_order(12.99)).to eq message
  end

  it 'raises an error if incorrect total' do
    allow(order).to receive(:total).and_return(13.00)
    expect{takeaway.confirm_order(12.99)}.to raise_error 'Incorrect total'
  end

end

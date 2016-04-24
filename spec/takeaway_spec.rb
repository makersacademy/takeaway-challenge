require 'takeaway'
describe TakeAway do
  subject(:takeaway){ described_class.new(menu)}
  let(:menu){double :menu, display_menu: {"Fried Rice" => 5.99,
    "Chicken Chow Mein" => 7.99, "Cheeseburger" => 6.99, "Pizza" => 8}}

  it 'shows the menu' do
    expect(takeaway.read_menu).to eq menu.display_menu
  end

  it{is_expected.to respond_to(:order_food).with(2).argument}

  it 'takes an order' do
    message = "2 order(s) of Fried Rice added to your cart"
    expect(takeaway.order_food("Fried Rice", 2)).to eq message
  end

  it 'shows a summary of the order' do
    takeaway.order_food("Fried Rice", 2)
    takeaway.order_food("Cheeseburger", 1)
    summary = "Fried Rice x 2 = $#{5.99 * 2}, Cheeseburger x 1 = $6.99"
    expect(takeaway.order_summary).to eq summary
  end

  it 'displays the total of the order' do
    takeaway.order_food("Fried Rice", 2)
    takeaway.order_food("Cheeseburger", 1)
    expect(takeaway.total).to eq (5.99 * 2) + (6.99)
  end

end

require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu, dishes: {'sushi' => '£5.99',
    'pizza' => '£7.99', 'burger' => '£4.99',
    'pie' => '£15.99', 'water' => '£2.99',
    'beer' => '£3.99'
  } }
  let(:takeaway) {described_class.new(menu)}
  it 'allows user to see a menu' do
    allow(menu).to receive(:show).and_return menu.dishes
    expect(takeaway.read_menu).to eq(menu.dishes)
  end
  it 'allows user to order a menu item' do
    allow(menu).to receive(:each).and_return 'sushi' => '£5.99'
    allow(menu).to receive(:on_menu?).and_return true
    allow(menu).to receive(:order)
    takeaway.order('sushi')
    expect(takeaway.basket).to eq 'sushi'=>'£5.99'
  end
  it 'raises an error if the item is not on the menu' do
    allow(menu).to receive(:each).and_return 'sushi' => '£5.99'
    allow(menu).to receive(:on_menu?).and_return false
    expect {takeaway.order('baloney') }.to raise_error("Sorry item is not on the menu!")
  end
end

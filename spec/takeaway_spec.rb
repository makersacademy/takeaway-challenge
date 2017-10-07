require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu, dishes: {'sushi' => 5.99,
    'pizza' => 7.99, 'burger' => 4.99,
    'pie' => 15.99, 'water' => 2.99,
    'beer' => 3.99
  } }
  let(:takeaway) {described_class.new(menu)}

  it 'allows user to see a menu' do
    allow(menu).to receive(:show).and_return menu.dishes
    expect(takeaway.read_menu).to eq(menu.dishes)
  end

  context 'when ordering' do
    before(:each) do
      allow(menu).to receive(:each).and_return menu.dishes
      allow(menu).to receive(:on_menu?).and_return true
    end
    it 'user can order a menu item' do
      expect(takeaway.order('sushi')).to eq 'sushi'=>5.99
    end
    it 'ordered items are stored in a basket' do
      takeaway.order('burger')
      expect(takeaway.basket).to eq 'burger'=> menu.dishes['burger']
    end
    it 'an error is raised if an item is not on the menu' do
      allow(menu).to receive(:each).and_return 'sushi' => 5.99
      allow(menu).to receive(:on_menu?).and_return false
      expect {takeaway.order('baloney') }.to raise_error("Sorry item is not on the menu!")
    end
    it 'user can clear the current basket and start again' do
      takeaway.order('burger', 2)
      takeaway.empty_basket
      expect(takeaway.basket).to be_empty
    end
  end

  context 'when complete' do
    it 'calculates the total cost of the order' do
    expect(takeaway.order_total).to eq "Your total is: £#{takeaway.basket.values.sum}"
    end
  end
end

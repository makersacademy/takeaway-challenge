require 'takeaway'
require 'time'

describe TakeAway do
  let(:menu) { double :menu, dishes: {'sushi' => 5.99,
    'pizza' => 7.99, 'burger' => 4.99,
    'pie' => 15.99, 'water' => 2.99,
    'beer' => 3.99
  } }
  let(:text) { double :text, sms: "Thank you! Your order will be delivered before #{(Time.now + 60*60).strftime("%H:%M")}"}
  let(:takeaway) {described_class.new(menu)}

  it 'allows user to see a menu' do
    allow(menu).to receive(:show).and_return menu.dishes
    expect(takeaway.read_menu).to eq(menu.dishes)
  end

  context 'when ordering' do
    before(:each) do
      allow(menu).to receive(:on_menu?).and_return true
    end
    it 'ordered items are stored in a basket' do
      takeaway.order('burger', 2)
      expect(takeaway.basket).to eq 'burger'=> [2, menu.dishes['burger']*2]
    end
    it 'an error is raised if an item is not on the menu' do
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
    before(:each) do
      allow(menu).to receive(:on_menu?).and_return true
      takeaway.order('sushi')
    end
    it 'calculates the total cost of the order' do
      takeaway.order('pizza')
      p takeaway.basket
      expect(takeaway.order_total).to eq "Your total is: £13.98"
    end
    it 'shows users their order summary' do
      allow(menu).to receive(:on_menu?).and_return true
      takeaway.order('sushi')
      expect(takeaway.show_basket).to eq "sushi x 1 = £5.99"
    end
    it 'clears the basket ready for the next order' do
      allow(takeaway).to receive(:send).with("Thank you! Your order will be delivered before #{(Time.now + 60*60).strftime("%H:%M")}")
      expect {takeaway.complete_order}.to change { takeaway.basket }.to be_empty
    end
  end
end

require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { spy(:menu) }

  before(:each) do
    allow(menu).to receive(:dish_in_menu?).with('dish1').and_return(true)
    allow(menu).to receive(:dish_price).with('dish1').and_return(10)
    allow(menu).to receive(:dish_in_menu?).with('dish2').and_return(true)
    allow(menu).to receive(:dish_price).with('dish2').and_return(15)
    takeaway.add_item('dish1')
    takeaway.add_item('dish2')
  end

  it '#show_menu' do
    takeaway.show_menu
    expect(menu).to have_received(:print_menu)
  end

  it '#add_item' do
    allow(menu).to receive(:dish_in_menu?).with('dish').and_return(true)
    expect{takeaway.add_item('dish',2)}.to change {takeaway.cart['dish']}.by(2)
  end

  describe '#check_payment' do

    it 'raise error if total given does not match the order price total' do
      message = 'Payment does not match order total!'
      expect{takeaway.check_payment(20)}.to raise_error message
    end

  end

  describe '#cart_summary' do

    it 'prints items and prices in the cart and order total' do
      expect{takeaway.cart_summary}.to output("1 X dish1 = $10\n1 X dish2 = $15\ntotal: $25\n").to_stdout
    end

  end

end
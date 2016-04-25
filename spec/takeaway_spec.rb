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

  describe '#add_item' do

    it '#add_item' do
      allow(menu).to receive(:dish_in_menu?).with('dish').and_return(true)
      takeaway.add_item('dish',2)
      expect(takeaway.cart['dish']).to eq 2
    end

    it 'cannot add item not in the menu' do
      allow(menu).to receive(:dish_in_menu?).with('dish').and_return(false)
      expect{ takeaway.add_item('dish') }.to raise_error 'dish does not exit!'
    end

  end


  describe '#cart_summary' do

    it 'prints items and prices in the cart and order total' do
      message = "1 X dish1 = $10\n1 X dish2 = $15\ntotal: $25\n"
      expect{takeaway.cart_summary}.to output(message).to_stdout
    end

  end

  describe '#order_total' do

    it 'calculates order total' do
      expect(takeaway.order_total).to eq 25
    end

  end

end
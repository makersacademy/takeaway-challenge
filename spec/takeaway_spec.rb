require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  # quanitity error ":quantity can't be coerced into Fixnum"
  # let(:quantity) { double :quantity }
  let(:price) { double :price }


  describe '#show_menu' do
    it 'should return menu' do
      allow(takeaway).to receive(:show_menu).and_return(menu)
      expect(takeaway.show_menu).to match menu
    end
  end

  describe '#add_dish' do
    it 'should respond to add_dish' do
      expect(takeaway).to respond_to(:add).with(2).arguments
    end

    it 'should confirm item added' do
      quantity = 2
      expect(takeaway.add(dish, quantity)).to eq "#{quantity}x #{dish} added to your basket"
    end
  end

  describe '#checkout' do
    before do
      # allow(:takeaway).to receive(:price_match?) { true }
    end

#TODO
    xit 'should give total if prices match' do
      allow(menu).to receive(:dishes).and_return ({:Pizza => 10})
      takeaway.add(:Pizza)
      expect(takeaway.checkout(50)).to eq 50
    end

    xit 'should raise error if price doesn\'t match' do
      expect(takeaway.checkout(50)).to_not eq 50
    end
  end


  before do
    allow(takeaway).to receive(:send_text)
  end

  xit 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text).with("Thank you for your order: £20.93")
    takeaway.complete_order(20.93)
  end

  describe '#send_message' do
    xit 'should send a text to customer' do
      expect(takeaway.send_message).to eq "Your order will be delivered"
    end
  end

end

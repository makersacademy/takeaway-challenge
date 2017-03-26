require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu}
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
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

    xit 'should confirm added' do
      allow(menu).to receive(:contain_item?) {true}
      expect(takeaway.add(dish, quantity)).to eq "#{quantity}x #{dish} added to your basket"
    end
  end

  describe '#checkout' do
    before do
      # allow(:takeaway).to receive(:price_match?) { true }
    end

    xit 'should give total if prices match' do
      allow(menu).to receive(:dishes).and_return ({:Pizza => 10})
      takeaway.add(:Pizza)
      expect(takeaway.checkout(50)).to eq 50
    end

    xit 'should raise error if price doesn\'t match' do
      expect(takeaway.checkout(50)).to_not eq 50
    end
  end

  describe '#calculate_total' do
    it 'should return total figure' do
      takeaway.add("Pizza", 2)
      expect(takeaway.calculate_total).to eq 20
    end
  end


end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:message) { double(:message) }
  let(:menu) { double(:menu) }

  it { is_expected.to(respond_to(:order)) }
  it { is_expected.to(respond_to(:order)) }


  describe '#order' do
    it 'checks that the item ordered is on the menu' do
      expect{takeaway.order("Not an item")}.to(raise_error("Sorry, that item is not on the menu"))
    end
    it 'accepts a dish name and adds it to the order' do
      takeaway.order("Omlette")
      expect(takeaway.basket).to(have_key("Omlette"))
    end
    it 'assigns a default of 1 when no quantity is provided' do
      takeaway.order("Omlette")
      expect(takeaway.basket).to(have_value(1))
    end
    it 'adds the order quantity to the basket' do
      takeaway.order("Omlette", 2)
      expect(takeaway.basket).to(have_value(2))
    end
    it 'confirms that the item and quantity is in the basket' do
      expect(takeaway.order("Omlette")).to(eq("1 Omlette has been added to your basket"))
    end
  end

  describe '#basket_total' do
    before do
      takeaway.order("Omlette")
      takeaway.order("Pancakes", 2)
    end
    it 'returns the total price of the order' do
      expect(takeaway.total).to(eq(20))
    end
  end

  describe '#place_order' do
    before do
      takeaway.order("Omlette")
      takeaway.order("Pancakes", 2)
    end
    it 'sends a text message confirming the order' do
      expect(message).to(receive(:send_message))
      takeaway.place_order(message)
    end
  end

end

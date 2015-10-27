require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  subject(:order) { described_class.new }
  let(:basket) { double :basket }

  describe '#open_menu' do
    it 'opens a list of dishes with prices' do
      expect(takeaway.open_menu).not_to be_empty
    end
  end

  describe '#order' do
    it 'reports items being added to basket' do
      expect{takeaway.order('kimchi', 2)}.to change{order.basket.length}.by(1)
    end
  end

  describe '#order_summary' do
    it 'creates an order summary' do
      takeaway.order('kimchi', 2)
      takeaway.order('salmon maki', 3)
      expect(takeaway.order_summary).to eq("kimchi x2 = £6.00, salmon maki x3 = £16.50")
    end
  end

  describe '#total' do
    it 'shows the total price' do
      takeaway.order('kimchi', 2)
      takeaway.order('salmon maki', 3)
      expect(takeaway.total).to eq("Total: £22.50")
    end
  end

  describe '#checkout' do
    it 'raises an error if the total bill does not match the sum' do
      takeaway.order('kimchi', 2)
      takeaway.order('salmon maki', 3)
      msg = 'Total cost does not match the sum of the dishes in your order!'
      expect{takeaway.checkout(16.5)}.to raise_error { msg }
    end
  end
end
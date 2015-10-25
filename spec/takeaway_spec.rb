require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(takeaway.dishes).to eq described_class::DISHES
    end
  end

  describe '#open_menu' do
    it 'opens a list of dishes with prices' do
      expect(takeaway.open_menu).not_to be_empty
    end
  end

  describe '#order' do
    it 'reports items being added to basket' do
      expect{takeaway.order('kimchi', 2)}.to change{ takeaway.basket.length}.by(1)
    end
  end

  describe '#basket_summary' do
    it 'creates an order summary' do
      takeaway.order('kimchi', 2)
      takeaway.order('salmon maki', 3)
      expect(takeaway.basket_summary).to eq("kimchi x2 = £6.00, salmon maki x3 = £16.50")
    end
  end

  describe '#total' do
    it 'shows the total price' do
      takeaway.order('kimchi', 2)
      takeaway.order('salmon maki', 3)
      expect(takeaway.total).to eq("Total: £22.50")
    end
  end
end
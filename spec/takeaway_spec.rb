require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double :dish => "Dish 1"}

  describe '#menu' do
    it 'should display a list of dishes with prices' do
      expect(takeaway.list).not_to be_empty
    end
  end

  describe '#select' do
    it 'should enable a user to select a dish' do
      takeaway.choose("Dish 1")
      expect(takeaway.order).to include(["Dish 1", 1.0])
    end

    it 'should enable a user to select multiple quantities of dishes' do
      takeaway.choose("Dish 1", 2)
      expect(takeaway.order).to include(["Dish 1", 1.0])
    end
  end

end

require "spec_helper"

describe Menu do
  let(:list_of_dishes) {Array.new}
  # subject(:menu) { subject.new }

  describe '#dishes' do
    it 'subject respond_to intstruction' do
      expect(subject).to respond_to(:dishes)
    end

    it 'should return the menu' do
      test_menu = described_class.new(:list_of_dishes)
      expect(test_menu.dishes).to eq(:list_of_dishes)
    end
  end
end

require "spec_helper"

describe Menu do
  let(:list_of_dishes) {Array.new}
  subject(:menu) { described_class.new }

  describe '#dishes' do
    it 'subject respond_to intstruction' do
      expect(menu).to respond_to(:dishes)
    end

    it 'should return the menu' do
      test_menu = defined_subject.new(menu)
      expect(test_menu.dishes).to eq menu
    end
  end
end

require 'order'
describe Order do
  describe '#choose_item' do
    it 'Can choose item from Menu' do
      subject.choose_dish("Fried Rice")
      expect(subject.ordered_items).to include("Fried Rice")
    end

    it 'Can choose item from Menu' do
        subject.choose_dish("Chicken")
        expect(subject.ordered_items).not_to include("Chicken")
      end
  end
end


require 'order'

RSpec.describe Order do
  describe '#select_item' do
    let(:dish) { double :dish }
    let(:dish2) { double :dish2 }
    it 'adds an item to the order' do
      subject.select_dish(dish)
      expect(subject.items).to eq [dish]
    end
    it 'adds multiple items to the order' do
      subject.select_dish(dish)
      subject.select_dish(dish2)
      expect(subject.items).to eq [dish, dish2] 
    end
  end
end

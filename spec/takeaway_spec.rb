require './docs/takeaway_menu'

describe Menu do
    
  let(:dish_name_1) {'burger'}
  let(:dish_price_1) {10}
  let(:dish_entry_1) { { :dish_name => dish_name_1 , :dish_price => dish_price_1 } }
  let(:dish_name_2) {'chips'}
  let(:dish_price_2) {5}
  let(:dish_entry_2) { { :dish_name => dish_name_2 , :dish_price => dish_price_2 } }

  describe '#add' do
    it 'adds a dish entry hash to the menu list array' do
      subject.add(dish_name_1, dish_price_1)
      expect(subject.print).to include(dish_entry_1)
    end
  end

 describe '#print' do
    it 'prints the menu list array' do
      subject.add(dish_name_1, dish_price_1)
      subject.add(dish_name_2, dish_price_2)
      expect(subject.print).to contain_exactly(dish_entry_1, dish_entry_2 )
    end
  end
end

describe Dish do
  let(:dish_name_1) {'burger'}
  let(:dish_price_1) {10}
  let(:dish_entry_1) { { :dish_name => dish_name_1 , :dish_price => dish_price_1 } }

  describe '#initialize' do
    it 'creates a dish entry as a hash' do
      dish = Dish.new(dish_name_1, dish_price_1)
      expect(dish.dish_entry).to eq(dish_entry_1)
    end
  end
end

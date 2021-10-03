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


describe Order do

  let(:dish_name_1) {'burger'}
  let(:dish_price_1) {10}
  let(:dish_entry_1) { { :dish_name => dish_name_1 , :dish_price => dish_price_1 } }
  let(:dish_name_2) {'chips'}
  let(:dish_price_2) {5}
  let(:dish_entry_2) { { :dish_name => dish_name_2 , :dish_price => dish_price_2 } }
  let(:menu_list) { [{ :dish_name => dish_name_1 , :dish_price => dish_price_1 }, { :dish_name => dish_name_2 , :dish_price => dish_price_2 }] }

  describe '#add' do
    it 'adds a dish entry to the order array' do
      subject.menu
      subject.add(dish_name_1)
      expect(subject.pending).to include(dish_entry_1)
    end
  end

  describe '#pending' do
    it 'pending order array can return multiple items' do
      subject.menu
      subject.add(dish_name_1)
      subject.add(dish_name_2)
      expect(subject.pending).to contain_exactly(dish_entry_1, dish_entry_2 )
    end
  end

  describe '#delete' do
    it 'deletes a dish entry from the pending order array' do
      subject.menu
      subject.add(dish_name_1)
      subject.delete(dish_name_1)
      expect(subject.pending).to eq([])
    end
  end

  describe '#total_price' do
    it 'keeps track of total order price after adding and deleting items' do
      subject.menu
      subject.add(dish_name_1)
      subject.delete(dish_name_1)
      subject.add(dish_name_2)
      expect(subject.total_price).to eq(dish_price_2)
    end
  end

  describe '#complete' do
    it 'creates a completed order array from the pending order array' do
      subject.menu
      subject.add(dish_name_1)
      subject.pending
      expect(subject.complete).to eq(subject.pending)
    end
  end


end
require 'order'

describe Order do

  context 'Selecting an order' do

    it 'Displays the current dishes on the order' do
      dish = {:name => 'Red curry', :price => 5.95} # can 'let' be used here?
      subject.add_dish dish
      expect(subject.show_order).to be_a_kind_of(Array) # Better test for this given more entries added to array and key-value pairs to hashes?
    end

    it 'Checking the total cost of the order' do
      dish1 = {:name => 'Red curry', :price => 5.95} # can 'let' be used here?
      dish2 = {:name => 'Green curry', :price => 6.95} # can 'let' be used here?
      subject.add_dish dish1
      subject.add_dish dish2
      expect(subject.total).to eq 12.9
    end

  end

end
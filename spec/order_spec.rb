require 'order'

describe Order do

  context 'Selecting an order' do

    it 'Displays the current dishes on the order' do
      dish = {'Korma': 4.95}
      subject.add_dish dish
      expect(subject.show_running_order).to be_a_kind_of(Array) # Better test for this given more entries added to array and key-value pairs to hashes?
    end

    it 'Checking the current cost of the order while adding items' do
      dish1 = {'Red Curry': 5.95}
      dish2 = {'Green Curry': 6.95}
      subject.add_dish dish1
      2.times { subject.add_dish dish2 }
      expect(subject.running_total).to eq 19.85
    end

  end

end
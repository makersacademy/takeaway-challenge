require 'order'

describe Order do

  context 'Selecting an order' do

    it 'Checking the running total of the order' do
      dish1 = {'Red Curry': 5.95}
      dish2 = {'Green Curry': 6.95}
      subject.add_dish dish1
      subject.add_dish dish2, 2
      expect(subject.running_total).to eq 19.85
    end

    it 'Displays the current dishes and total of the order' do
      dish = {'Korma': 4.95}
      subject.add_dish dish, 2
      expect(subject.display_running_order).to eq "[\"Korma @ £4.95 x 2\"]; TOTAL: £9.9"
    end

  end

end
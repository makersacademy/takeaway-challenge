require "order"
require "menu"

describe Order do

  describe '#select' do
    it 'Selects one dish' do
      subject.select_item('Egg Fried Rice')
      expect(subject.print_selected_dishes).to eq('You have chosen to order: Egg Fried Rice')
    end

    it 'Selects multiple dishes' do
      subject.select_item('Egg Fried Rice')
      subject.select_item('Prawn Crackers')
      expect(subject.print_selected_dishes).to eq('You have chosen to order: Egg Fried Rice, Prawn Crackers')
    end
  end

  describe '#calculate_total_of_selected_dishes' do
    it 'Calculates the total cost of one dish' do
      subject.select_item('Sweet and Sour Chicken')
      expect(subject.calculate_total_of_selected_dishes).to eq('Your order will cost: £5')
    end

    it 'Calculates total cost of multiple dishes' do
      subject.select_item('Egg Fried Rice')
      subject.select_item('Prawn Crackers')
      subject.select_item('Sweet and Sour Chicken')
      expect(subject.calculate_total_of_selected_dishes).to eq('Your order will cost: £10')
    end
  end
end

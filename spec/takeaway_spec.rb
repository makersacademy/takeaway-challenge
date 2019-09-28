require 'takeaway'

describe TakeAway do

  describe '#read_menu' do
    it 'reads the menu of dishes' do
      expect(subject).to respond_to(:read_menu)
    end
  end

  describe '#order' do
    it 'let the user order a dish from the menu with default quantity' do
      dish = 'Prawn Dumpling'
      result = 'Prawn Dumpling', 1
      subject.order_dish(dish)
      expect(subject.order).to include result
    end

    it 'let the user order a dish from the menu adding quantity' do
      dish = 'Prawn Dumpling'
      quantity = 5
      result = 'Prawn Dumpling', 5
      subject.order_dish(dish, quantity)
      expect(subject.order).to include result
    end
  end

end

require 'selection'

describe Selection do

  let(:selection)   { described_class.new }
  let(:dish)        { "meat" }
  let(:quantity)    { 2 }

  describe '#initialize' do
    it 'initializes with an empty array' do
      expect(selection.choices).to eq []
    end
  end

  describe '#add' do
    it 'adds a menu item to the choices array' do
      selection.add(dish, quantity)
      expect(selection.choices).to include ({dish: dish, quantity: quantity})
    end
  end

  describe '#total' do
    it 'returns the total cost' do
      # test needs to be isolated from the Menu class (MENU constant)
      selection.add(dish, quantity)
      expect(selection.total).to eq 20
    end
  end

end

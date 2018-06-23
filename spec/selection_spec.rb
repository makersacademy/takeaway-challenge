require 'selection'

describe Selection do

  let(:selection)   { described_class.new }
  let(:choice)      { "meat" }
  let(:quantity)    { 2 }

  describe '#initialize' do
    it 'initializes with an empty array' do
      expect(selection.choices).to eq []
    end
  end

  describe '#add' do
    it 'adds a menu item to the choices array' do
      selection.add(choice, quantity)
      expect(selection.choices).to include ({choice: choice, quantity: quantity})
    end
  end

  describe '#total' do
    it 'returns the total cost' do
      # test needs to be isolated from the Menu class (MENU constant)
      selection.add(choice, quantity)
      expect(selection.total).to eq 20
    end
  end

end

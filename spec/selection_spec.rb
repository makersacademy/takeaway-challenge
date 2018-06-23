require 'selection'

describe Selection do

  let(:selection)   { described_class.new }
  let(:choice)      { :choice }

  describe '#initialize' do
    it 'initializes with an empty array' do
      expect(selection.choices).to eq []
    end
  end

  describe '#add' do
    it 'adds a menu item to the choices array' do
      selection.add(choice)
      expect(selection.choices).to include choice
    end
  end
end

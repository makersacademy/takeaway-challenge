require 'selection'

describe Selection do

  let(:selection)   { described_class.new }
  let(:choice)      { "meat" }

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

  describe '#print_summary' do
    it 'returns a summary and price' do
      # test needs to be isolated from the Menu class (MENU constant)
      selection.add(choice)
      expect(selection.print_summary).to eq "#{choice} | Total: £10"
    end
  end

end

require 'selection'

describe Selection do

  let(:selection)   { described_class.new }
  let(:dish)        { "meat" }
  let(:quantity)    { 2 }

  # test ok
  describe '#initialize' do
    it 'initializes with an empty array' do
      expect(selection.choices).to eq []
    end
  end

  # test ok
  describe '#add' do
    it 'adds a menu item to the choices array' do
      selection.add(dish, quantity)
      expect(selection.choices).to include(dish: dish, quantity: quantity)
    end
  end

  # test ok
  describe '#total' do
    let(:mock_Summary) { double(:mock_Summary, new: mock_summary) }
    let(:mock_summary) { double(:mock_summary, total: 20) }
    let(:mock_menu)    { double(:mock_menu) }
    it 'provides the total of the choices array' do
      expect(selection.total(mock_Summary, mock_menu)).to eq(20)
    end
  end

end

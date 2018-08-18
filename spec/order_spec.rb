require 'order'

describe Order do

  let(:order)            { described_class.new(menu_class, selection_class) }
  let(:menu_class)       { double(:menu_class, new: :mock_menu) }
  let(:selection_class)  { double(:selection_class, new: :mock_selection) }
  let(:mock_menu)        { double(:mock_menu, options: "options" ) }
  let(:mock_selection)   { double(:mock_selection, add: "stuff" ) }

  describe '#initialize' do

    it 'creates a new menu' do
      expect(order.menu).to eq :mock_menu
    end

    it 'creates a new selection' do
      expect(order.selection).to eq :mock_selection
    end

  end

  describe '#show_menu' do

    it 'should show a menu' do
      expect(mock_menu).to respond_to :options
    end

  end

  describe '#add' do

    let(:dish)      {:dish}
    let(:quantity)  {:quantity}


    it 'adds a specified order to the selection' do

      expect(mock_selection).to receive(:add) {"added"}
      order.add(dish, quantity)

    end

  end

end

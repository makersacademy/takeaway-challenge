require 'order'

describe Order do

  it { is_expected.to respond_to(:add).with(2).arguments }

  let(:order)         { described_class.new(menu, selection) }

  let(:menu)          { double :menu, new: list }
  let(:list)          { double :list, options: "chicken" }

  let(:selection)     { double :selection, new: choices, print_summary: summary }
  let(:choices)       { double :choices, choices: [] }
  let(:summary)       { double :summary }

  describe '#initialize' do
    it 'initializes with a menu' do
      expect(order.menu).to eq list
    end

    it 'initializes with an empty selection array' do
      expect(order.selection).to eq choices
    end

  end

  describe '#show_menu' do
    it 'shows the dishes and prices' do
      expect(order.show_menu).to eq "chicken"
    end
  end

  describe '#add' do
    it 'adds a choice to the selection array' do
      # test needs to be isolated from the Selection class
      order = Order.new
      order.add("meat", 2)
      expect(order.selection.choices).to include({ dish: "meat", quantity: 2 })
    end
  end

  describe '#confirm' do
    #uncomment this to pass test
    #let(:mock_Confirmation) { double(:mock_Confirmation, new: mock_confirmation) }
    let(:mock_confirmation) { double(:mock_confirmation, place_order: 'Message sent') }
    it 'places an order' do
      #testing to remove dependency on selection - doesn't work yet
      #allow(:mock_Confirmation).to receive(:new).with(0,0).and_return(:mock_confirmation)
      expect(subject.confirm(0,mock_Confirmation)).to eq 'Message sent'
    end
  end

      #
      #
      # allow(confirmation).to receive(:place_order) { 'Message sent' }
      # expect(confirmation.place_order).to eq 'Message sent'
      #
      # # OR YOU COULD DO... is this the same thing?
      # # expect(confirmation).to receive(:place_order)
  #     # confirmation.place_order
  #   end
  # end
end

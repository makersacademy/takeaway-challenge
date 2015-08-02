require 'order'

describe Order do
  let(:restaurant) {double (:restaurant), :menu => menu, :check_inclusion? => true, :get_price => 10}
  let(:invalid_choice) {double (:restaurant), :menu => menu, :check_inclusion? => false}
  let(:menu) {double (:menu), items: { pizza: 10, lasagne: 8, omlette: 4 }}

  describe '#add' do

    it 'raises an error if the food_item is invalid' do
      expect{subject.add invalid_choice, :chips}.to raise_error "Invalid menu selection. Please try again."
    end

    it 'adds the first selected item to the order_summary hash' do
      subject.add restaurant, :pizza
      expect(subject.order_summary.keys).to match_array([:pizza])
    end

    it 'adds a second group of selected items to the order_summary hash' do
      subject.add restaurant, :pizza
      subject.add restaurant, :lasagne, 2
      expect(subject.order_summary.keys).to match_array([:pizza, :lasagne])
    end

    it 'adds the quantity of items to the order_summary hash' do
      subject.add restaurant, :pizza
      subject.add restaurant, :lasagne, 2
      expect(subject.order_summary.values).to match_array([1, 2])
    end

    it 'adds the price of each item added to the total_cost array' do
      subject.add restaurant, :pizza
      subject.add restaurant, :pizza, 2
      expect(subject.total_cost).to be 30
    end
  end

  describe '#display_order' do
    it 'displays the order in a terminal-table' do
      puts '  **This was tested manually**'
    end
  end

  describe '#check_inclusion?' do
    it 'checks that the item exists on the selected restaurant\'s menu' do
      allow(restaurant).to receive(:check_inclusion?)
      expect(restaurant).to receive(:check_inclusion?)
      subject.check_inclusion? restaurant, :pizza
    end
  end

  describe '#get_price' do
    it 'sends the get_price message to a restaurant object' do
      allow(restaurant).to receive(:get_price)
      expect(restaurant).to receive(:get_price)
      subject.get_price restaurant, :pizza
    end
  end

  describe '#display_order' do
    it 'produces a terminal table with the correct information' do
      puts '  **This was tested manually**'
    end
  end

end

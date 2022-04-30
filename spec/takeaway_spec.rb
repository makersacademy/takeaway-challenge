describe Takeaway do
  let(:menu) { instance_double('Menu') }
  let(:order) { instance_double('Order') }
  let(:text) { instance_double('Text') }

  subject(:takeaway) { Takeaway.new(menu, order, text) }

  describe '#display_menu' do
    it 'should instruct menu to return available dishes' do
      expect(menu).to receive(:display_available_dishes)
      takeaway.display_menu
    end
  end

  describe '#add_to_order' do
    it 'should instruct current_order to add dishes to basket' do
      expect(order).to receive(:add_to_basket)
      dishes = ['pizza', 'pasta']
      takeaway.add_to_order(dishes)
    end
  end

  describe '#place_order' do
    it 'should instruct current_order to complete' do
      allow(order).to receive(:complete_order)
      allow(text).to receive(:send_completion_message)

      expect(order).to receive(:complete_order)
      takeaway.place_order
    end

    it 'should instruct text to send_completion_message' do
      allow(order).to receive(:complete_order)
      allow(text).to receive(:send_completion_message)

      expect(text).to receive(:send_completion_message)
      takeaway.place_order
    end
  end
end

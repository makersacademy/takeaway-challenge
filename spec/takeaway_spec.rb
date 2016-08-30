require 'takeaway'

  describe Takeaway do
    subject(:takeaway) {described_class.new(menu,order)}
    let(:menu) {spy(:menu)}
    let(:order) {spy(:order)}

    describe '#read_menu' do
      it 'should ask menu to be listed' do
        takeaway.read_menu
        expect(menu).to have_received(:list)
      end
    end

    describe '#order_item' do
      it 'should ask order to add item' do
        takeaway.order_item(1)
        expect(order).to have_received(:add_item)
      end
    end

    describe '#summary' do
      it 'should ask order for a summary' do
        takeaway.summary
        expect(order).to have_received(:view_order)
      end
    end

    describe '#total' do
      it 'should ask order to add item' do
        takeaway.total
        expect(order).to have_received(:total)
      end
    end

    describe '#checkout' do
      it 'should ask order to complete order' do
        takeaway.checkout(12)
        expect(order).to have_received(:checkout).with 12
      end
    end
  end
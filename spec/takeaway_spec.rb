require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu, messenger) }
  let(:menu) { double(:menu) }
  let(:messenger) { double(:messenger) }

  describe '#display_menu' do
    it 'displays the menu' do
      expect(menu).to receive(:show)
      takeaway.display_menu
    end
  end

  describe '#choose_item' do
    before do
      allow(menu).to receive(:show).and_return([{ item_name: 'Pizza', price: '1.50' }])
    end

    it 'chooses an item and a quantity to order' do
      takeaway.choose_item('Pizza')
      expect(takeaway.order).to include({ item_name: 'Pizza', price: '1.50', quantity: 1 })
    end

    it 'checks if the item is on the menu' do
      expect { takeaway.choose_item('exoticfood', 100) }.to raise_error 'Cannot choose this item!'
    end

    it 'does not allow negative values' do
      expect { takeaway.choose_item('Pizza', -1) }.to raise_error 'Must choose a number >0'
    end

    it 'does not allow same item to be added twice' do
      takeaway.choose_item('Pizza')
      expect { takeaway.choose_item('Pizza') }.to raise_error 'Item already in order, please remove it first'
    end

    it 'lets the user know what was added to the order' do
      expect(takeaway.choose_item('Pizza')).to eq "Pizza x1 = £1.50"
    end
  end

  describe '#delete_item' do
    it 'should delete a request item from the order' do
      allow(menu).to receive(:show).and_return([{ item_name: 'Pizza', price: '1.50' }])
      takeaway.choose_item('Pizza')
      takeaway.delete_item('Pizza')
      expect(takeaway.order).to be_empty
    end
  end

  describe '#view_order' do
    context 'nothing has been chosen' do
      it 'raises an error' do
        expect { takeaway.view_order }.to raise_error 'Please select an item first'
      end
    end

    context 'there have been some items chosen' do
      it 'shows the order' do
        allow(menu).to receive(:show).and_return([{ item_name: 'Pizza', price: '1.50' }])
        takeaway.choose_item('Pizza')
        expect(takeaway.view_order).to eq 'Pizza x1 = £1.50'
      end
    end
  end

  describe '#view_total' do
    before do
      allow(menu).to receive(:show).and_return([{ item_name: 'Pizza', price: '1.50' }])
      takeaway.choose_item('Pizza')
    end

    it 'calculates the total' do
      expect { takeaway.view_total }.to change { takeaway.total_cost }.by(1.50)
    end
  end

  describe '#place_order' do
    before do
      allow(takeaway).to receive(:send_confirmation)
    end

    it 'sends a text message' do
      expect(takeaway).to receive(:send_confirmation).with("Thank you for your order. The grand total is £0.00 and will be with you within the hour!")
      takeaway.place_order
    end

    it 'clears the order' do
      takeaway.place_order
      expect(takeaway.order).to be_empty
    end

    it 'clears the order' do
      expect(takeaway.place_order).to eq 'Order placed!'
    end
  end
end

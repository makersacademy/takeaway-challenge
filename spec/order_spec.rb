require 'order'

describe Order do
  describe '#add_to_order' do
    it 'should be initialized with no items' do
      expect(subject.items.length).to eq 0
    end

    it 'should not allow invalid items to be added' do
      expect { subject.add_to_order(:fakepizza, 1) }.to raise_error("Item not found")
    end

    it 'should allow valid items to be added' do
      expect { subject.add_to_order(:pizza, 1) }.to change { subject.items.length }.by 1
    end

    it 'should not allow a quantity of less than 1 to be accepted' do
      expect { subject.add_to_order(:pizza, 0) }.to raise_error("Quantity must be greater than 0")
    end

    it 'should update cost on addition of item' do
      expect { subject.add_to_order(:pizza, 2) }.to change { subject.total_cost }.by 2.30
    end
  end
end

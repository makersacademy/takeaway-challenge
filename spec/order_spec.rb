require 'order'

describe Order do
  let(:working_order) { { sushi: 2, burger: 1, total: 4 } }
  let(:failing_order) { { sushi: 2, burger: 1, total: 3 } }
  let(:number) { double(:customer_phone_number) }
  
  describe 'initialize' do
    it 'creates a new order' do
      expect(subject.current_total).to eq 0
    end
  end

  describe '#add' do
    xit 'totals up an order' do
      subject.add(working_order, number)
      expect(subject.current_total).to eq 4
    end

    xit 'confirms an order total is the same as the given total' do
      expect { subject.add(working_order, number) }.not_to raise_error
    end

    it 'returns error if incorrect' do
      expect { subject.add(failing_order, number) }.to raise_error 'Incorrect total'
    end
  end
end

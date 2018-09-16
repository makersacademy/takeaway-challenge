require 'order'

describe Order do
  let(:test_order) { { sushi: 2, burger: 1, total: 4 } }
  let(:fail_order) { { sushi: 2, burger: 1, total: 3 } }
  describe 'initialize' do
    it 'creates a new order' do
      expect(subject.current_total).to eq 0
    end
  end

  describe '#add' do
    it 'accepts a list of items' do
      expect { subject.add(test_order) }.not_to raise_error
    end

    it 'totals up an order' do
      subject.add(test_order)
      expect(subject.current_total).to eq 4
    end

    it 'confirms an order is the same as the given total' do
      expect(subject.add(test_order)).to eq true
    end
  end
  #   it 'adds a requested dish to the order' do
  #     subject.add('sushi')
  #     expect(subject.current_order).to eq(['sushi'])
  #   end

  #   it 'checks dish is on the menu' do
  #     expect { subject.add('foo') }.to raise_error 'foo not on menu'
  #   end
  # end
end

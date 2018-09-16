require 'order'

describe Order do
  describe 'initialize' do
    it 'creates a new order' do
      expect(subject.current_order).to eq []
    end
  end

  describe '#add' do
    it 'adds a requested dish to the order' do
      subject.add('sushi')
      expect(subject.current_order).to eq(['sushi'])
    end

    it 'checks dish is on the menu' do
      expect{ subject.add('foo') }.to raise_error 'foo not on menu'
    end
  end
end

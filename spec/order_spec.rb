require 'order'

describe Order do
  let(:menu) { Menu.new }

  describe '#initialize' do
    it 'order initializes as blank' do
      expect(subject.current_order).to eq nil
    end
  end

  describe '#create' do
    it 'creates an order' do
      
    end
  end
end
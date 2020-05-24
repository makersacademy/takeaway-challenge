require 'order'

describe Order do

  context '#customers_order' do
    it 'stores customers ordered dishes' do
      expect(subject).to respond_to(:customers_order)
    end
  end
end

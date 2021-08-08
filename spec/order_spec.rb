require 'order'

describe Order do
    
  context 'checking to see that methods exist' do
    
    it 'initializes order with a new array' do
        expect(subject).to respond_to(:current_order)
    end
  end

end
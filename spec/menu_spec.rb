require 'menu'

describe Menu do
    
  context 'checking to see if various methods exist' do
  
  it 'expects menu to exist' do
      expect(subject).to respond_to(:menu)
  end
  
  end

end
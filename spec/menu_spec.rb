require 'menu'

describe Menu do
  
  it 'should respond to Menu' do
    expect(subject).to respond_to(:display_menu)
  end
  
  it 'the menu should not be empty' do
    expect(subject.display_menu).not_to be_empty
  end  
    
  
  
end
 
# I would like to see a list of dishes with prices

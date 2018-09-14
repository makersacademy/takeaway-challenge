require './lib/takeaway'

describe Takeaway do
  
  it 'to be able to see the menu' do
    expect(subject.menu).not_to raise_error
  end
end

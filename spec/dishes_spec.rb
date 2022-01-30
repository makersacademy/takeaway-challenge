require 'dishes'

describe Dishes do
  
  it 'check that dishes has a hash of dishes with prices' do
      expect(subject).to respond_to(:list)
  end

end
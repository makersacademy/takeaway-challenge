require 'Takeaway.rb'

describe Takeaway do

  describe '#initialize' do
    it 'has a list of all dishes and prices' do
      allow(subject.intialize).to receive(:menu).and_return({doner: 5, burger: 10, pizza: 20})
    end
  end

end

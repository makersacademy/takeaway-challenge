require './lib/takeaway.rb'

describe Takeaway do

  context '#initialize' do
    it 'should have menu injected into it on initialize' do
      expect(Takeaway.new.menu).to be_an_instance_of(Hash)
    end
  end

end

require './lib/restaurant'

describe Restaurant do

  describe '#initialize' do
    it 'initializes with Menu' do
      expect(subject.menu).to be_an_instance_of Menu
    end
  end




end
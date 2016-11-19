require 'takeaway.rb'

describe Takeaway do
  # subject(:takeaway) {described_class.new}

  context 'Menu' do
    it 'should retreive a Menu' do
      expect(subject.menu).to be_a_kind_of(Hash)
    end
    
  end

end

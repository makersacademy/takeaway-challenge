require 'menu.rb'

describe Menu do

    it 'should retreive a Menu' do
      expect(subject.menu).to be_a_kind_of(Hash)
    end

end

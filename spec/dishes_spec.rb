require 'dishes'

describe Dishes do

  describe '#list', :list do
    it 'Returns an empty array upon initialisation' do
      expect(subject.list).to be_empty
    end
  end
end

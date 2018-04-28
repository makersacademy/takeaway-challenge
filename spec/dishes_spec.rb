require 'dishes'

describe Dishes do

  describe '#list', :list do
    it 'Returns an array of 10 dishes with prices' do
      expect(subject.list.length).to eq 10
    end
  end
end

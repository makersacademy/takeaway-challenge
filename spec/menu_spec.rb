require 'menu'

describe Menu do

  describe 'on initialize' do
    it 'has a default menu' do
      expect(subject.items).to eq [{:pizza=>"£9"}, {:pasta=>"£7"}]
    end
  end
end
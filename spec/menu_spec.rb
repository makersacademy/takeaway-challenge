require 'menu'

describe Menu do

    it 'should be a hash' do
      expect(subject.list.is_a?(Hash)).to be(true)
    end
  end



#
# context 'on initialize' do
#   it 'has a list of dishes and prices' do
#     expect(subject.dishes).to eq(dishes)
#   end
# end

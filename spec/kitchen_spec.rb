# describe Kitchen do
#   describe Meal do
#     subject { described_class.new(:marinara, 8) }
#
#     it 'can be initialized with a hash' do
#       expect(subject.name).to be :marinara
#     end
#
#     it 'has a price' do
#       expect(subject.price).to be 8
#     end
#   end
#
#   describe '#prepare' do
#     it 'prepares a new meal' do
#       let(:marinara) { Meal.new(:marinara, 8) }
#       expect(subject.prepare(marinara: 8)).to eq marinara
#     end
#   end
# end

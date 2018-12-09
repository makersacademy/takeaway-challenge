require 'take_away'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'returns a menu when requested' do
  expect(takeaway).to respond_to(:view_menu).with(1).argument
 end
end

# describe '#view_menu' do
#   it 'will return an instance of the Menu class' do
#     expect(subject.view_menu).to eq (Menu)
#   end
# end

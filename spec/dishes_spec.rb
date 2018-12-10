require 'dishes'
#
# # Menu will be used to store list and respond to requests.
#
# describe Menu do
#   it 'will feed menu data to the Takeaway class' do
#     expect(subject).to respond_to(:send_menu)
#   end
# end

describe Dishes do
  subject(:dishes) { described_class.new }

  it 'display a list of dishes' do
    expect(dishes).to respond_to(:display)
  end
end

require 'menu'
#
# # Menu will be used to store list and respond to requests.

describe Menu do
  subject(:menu) { described_class.new }

  it 'display a list of dishes' do
    expect(menu).to respond_to(:display)
  end
end

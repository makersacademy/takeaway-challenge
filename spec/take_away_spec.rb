require 'take_away'
require 'menu'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'returns a menu when requested' do
    expect(takeaway).to respond_to(:view_menu)
  #
  # describe '#view_menu' do
  #   expect(takeaway.view_menu).to eq ()
  end
end

 # describe '#view_menu' do
 #   it 'should return an instance of menu' do
 #   expect(takeaway.view_menu).to eq(Menu.display)

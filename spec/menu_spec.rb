# "fake" is used as the test instance, for easy understanding
require 'Menu'

describe Menu do
  let(:fake_menu) { described_class.new }
  
  context 'display menu' do # user can see menu

    it 'shows a hash of menu items with prices' do
      expect(subject).to respond_to(:food) # Menu class reads :food attribute
      expect(subject.food).to be_a(Hash) # :food is a hash     
    end
  end
end

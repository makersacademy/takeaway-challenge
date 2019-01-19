require 'restaurant'

describe Restaurant do
  subject(:takeaway) { described_class.new }

  describe 'Class access:' do
    it 'creates a new instance of a menu on initialize' do
      expect(takeaway.menu).to be_an_instance_of(Menu)
    end
  end
  describe 'Display requests:' do
    it 'responds to a request to display a restaurant menu' do
      expect(takeaway).to respond_to(:show_menu)
    end
  end
end

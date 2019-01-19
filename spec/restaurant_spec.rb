require 'restaurant'

describe Restaurant do
  subject(:takeaway) { described_class.new }
  describe 'Display requests' do
    it 'responds to a request to display a restaurant menu' do
      expect(takeaway).to respond_to(:show_menu)
    end

  end
end

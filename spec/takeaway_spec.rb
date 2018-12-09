require 'takeaway'

describe Takeaway do
  describe 'show_menu' do
    it 'subject shows menu' do
      expect(subject).to respond_to(:show_menu)
    end
  end
end

require 'takeaway'

describe Takeaway do
  describe 'view_menu' do
    it 'prints a menu' do
      expect(subject.view_menu).to include({ Burger: :£4 })
    end
  end
end

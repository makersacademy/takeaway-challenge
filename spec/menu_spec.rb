require 'menu'

describe Takeaway do
  describe 'a menu available for a customer to see' do
    it 'shows the menu' do
      expect(subject.show_menu).to eq subject.menu
    end

    it { is_expected.to respond_to :select_meal}
  end
end

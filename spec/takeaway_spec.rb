require 'takeaway'

describe Takeaway do
  it 'responds to show_menu' do
    expect(subject).to respond_to(:show_menu)
  end
  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      expect(subject.show_menu).to eq(Takeaway::MENU)
    end
  end
end

require 'takeaway'
describe Takeaway do

  subject(:takeaway){described_class.new(:burger)}

  describe '#show_menu'do
    it 'shows the customer the available dishes and the prices'do
    expect(subject.show_menu).to eq Menulist::MENULIST[:burger]
    end
  end

end

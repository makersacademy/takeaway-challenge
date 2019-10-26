require 'takeaway'

describe Takeaway do

  context 'getting a menu' do
    let(:menu_double) { double :menu }

    it 'gets a menu' do 
      allow(menu_double).to receive(:show_menu) { 'string' }
      expect(subject.get_menu(menu_double)).to eq 'string'
    end

  end

end

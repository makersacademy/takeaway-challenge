require 'takeaway'

describe Takeaway do

  context 'getting a menu' do
    let(:menu_double) { double :menu }
    let(:subject) { Takeaway.new(menu_double) }

    it 'gets a menu' do 

      allow(menu_double).to receive(:display_menu) { 'string' }
      expect(subject.show_menu).to eq 'string'
    end

  end

end

require 'menu'
require 'order'

describe Menu do

  describe '#view_menu' do
    it 'should show the items on the menu' do
      allow(subject).to receive(:view_menu) { "noodles, 9"}
      expect(subject.view_menu).to eq "noodles, 9"
    end
  end

  describe '#import_menu' do
    it 'should import the contents of the file into menu_import object' do
      expect { subject.import_menu }.to change { subject.menu_import }
    end
  end
end

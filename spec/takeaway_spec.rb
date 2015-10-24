require 'takeaway'

describe Takeaway do

  let(:takeaway) {described_class.new}
  let(:menu_file) {double(:each_line=> nil)}


  describe 'viewing the list of dishes' do
    it 'displays the list of dishes' do
      allow(File).to receive(:read).and_return(menu_file)
      expect(File).to receive(:read)
      takeaway.menu
    end
  end

end

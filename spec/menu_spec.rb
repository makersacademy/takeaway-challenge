require './lib/menu'

describe Menu do
  
  describe "#menu_items" do
    it "expects there to be a menu list on initialization" do
      expect(subject.menu_list).not_to be_empty
    end
  end

  describe '#read_menu' do
    specify { expect { subject.read_menu }.to output.to_stdout }
  end
end
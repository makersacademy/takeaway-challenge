require 'menu'

describe Menu do
  describe "#show_menu" do
    it 'should show all items in the menu with their respective prices' do
      expect { subject.show_menu }.to output(" \n").to_stdout
    end
  end
end
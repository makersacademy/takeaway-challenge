require 'takeaway'

describe Takeaway do

  let(:menu_double) { double :menu }
  subject(:takeaway) { described_class.new(menu_double) }

  context "gets a menu" do

    it "shows menu options" do
      allow(menu_double).to receive(:display_menu) { { rice: 2.5 } }
      expect(takeaway.show_menu).to eq({ rice: 2.5 })
    end
  end

end

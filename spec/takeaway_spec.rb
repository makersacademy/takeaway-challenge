require "takeaway"

describe Takeaway do

  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }

  describe "menu" do

    it "can check the menu" do
      expect(takeaway.menu).to eq menu
    end
  #
  #   # it 'can check the menu dishes' do
  #   #   subject.check_menu
  #   #   expect(subject.menu).to include dish
  #   # end
  #   #
  #   # it 'can check the menu prices' do
  #   #   subject.check_menu
  #   #   expect(subject.menu).to include price
  #   # end
  #
  end

end

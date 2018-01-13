require "takeaway"

describe Takeaway do

  describe "#check_menu" do

    it "can check the menu" do
      expect(subject.check_menu).to eq []
    end

    # it 'can check the menu dishes' do
    #   subject.check_menu
    #   expect(subject.menu).to include dish
    # end
    #
    # it 'can check the menu prices' do
    #   subject.check_menu
    #   expect(subject.menu).to include price
    # end

  end

end

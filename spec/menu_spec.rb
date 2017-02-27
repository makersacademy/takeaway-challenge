require 'menu'

describe Menu do

  context "#show_menu" do
    it "should show the menu" do
      expect(subject).to respond_to(:show_menu)
    end
  end

end

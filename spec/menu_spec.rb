require 'menu'

describe Menu do

  context "#print_menu" do
    it "should print the menu" do
      expect(subject).to respond_to(:print_menu)
    end

  end

end

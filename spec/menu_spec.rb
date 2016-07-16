require 'menu'

describe Menu do

  context "is able to respond to" do
    it "#display_menu" do
      expect(subject).to respond_to(:display_menu)
    end
  end

  

end

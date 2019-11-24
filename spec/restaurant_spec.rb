require 'restaurant'

describe Restaurant do

  describe '#display_menu' do
    it "returns a list of dishes and prices" do
      expect(subject.display_menu).to include(Restaurant::MENU[0][:dish].to_s)
    end

  end

end

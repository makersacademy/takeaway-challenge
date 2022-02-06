require 'menu'
describe Menu do
  describe '#display_menu' do
    it "Responds to display menu" do
      expect(subject).to respond_to(:display_menu)
    end

    it "includes menu" do
      expect(subject.display_menu).to include "Pizza"
    end

    it "includes menu" do
      expect(subject.display_menu).to include "Fried Rice"
    end

    it "includes menu" do
      expect(subject.display_menu).to include "Pepsi"
    end

    it "includes menu" do
      expect(subject.display_menu).to include "Chips"
    end

    it "includes menu" do
      expect(subject.display_menu).to include "Roti"
    end
  end
end
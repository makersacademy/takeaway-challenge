require 'menu'

describe Menu do

  describe '#display' do
    it "returns a list of dishes and prices" do
      expect(subject.display).to eq Menu::MENU
    end
  end
end

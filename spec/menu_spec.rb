require './docs/menu.rb'

describe Menu do
  context "#display" do
    it "shows the menu and prices" do
      expect(subject.display).to eq(subject.items)
    end
  end
end

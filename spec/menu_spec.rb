require 'menu'

RSpec.describe Menu do
  let(:subject) { Menu.new }
  describe '#show_menu' do
    it "shows the content of the menu" do
      subject.stub(:gets).and_return("y")
      expect(subject).to respond_to :show_menu
    end

    it "has a content of the following text" do
      subject.stub(:gets).and_return("y")
      expect(subject.show_menu).to eq(@menu = {
        "dishes" => "price",
        "Tortellini skewers" => 4,
        "Asparagus and mozerella parcels" => 5,
        "Spagetti Carbonara" => 8,
        "Margharita Pizza" => 7,
        "Selection of Icecream" => 3
        })
    end
  end
end

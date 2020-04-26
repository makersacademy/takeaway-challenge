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

  describe '#add_to_basket' do
    it 'checks for for user_input' do
      subject.stub(:gets).and_return("Spagetti Bolognese")
      allow($stdin).to receive(:gets).and_return("Spagetti Bolognese")
    end

    it 'asks for the quantity you would like' do
      subject.stub(:gets).and_return("8")
      allow($stdin).to receive(:gets).and_return("8")
    end

    it 'returns an array' do
      subject.stub(:gets).and_return("8")
      allow($stdin).to receive(:gets).and_return("8")
    end
  end
end

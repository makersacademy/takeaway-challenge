require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#list_of_dishes' do
    it 'should be a hash' do
      expect(subject.list_of_dishes).to be_an_instance_of(Hash)
    end

    it "has a list of menu items" do
      expect(menu.list_of_dishes).to include(:balti => 5.00, vindaloo: 4.50)
    end
  end

  describe "#print_menu" do
    it "prints out a list of menu items and their prices" do
      expect(menu.print_menu).to eq "balti £5.0 , vindaloo £4.5"
    end
  end
end

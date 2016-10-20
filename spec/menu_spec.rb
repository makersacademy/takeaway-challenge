require 'menu'


describe Menu do
  subject(:menu) {described_class.new('./lib/menu.csv')}

  it "has a dishes attribute" do
    expect(subject).to respond_to(:dishes)
  end

  describe "#read_menu" do
    it "prints the dishes from the loaded menu" do
      expect(menu.read_menu).to include("pasta"=>10)
    end
  end

end

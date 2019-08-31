require './lib/menu'

describe Menu do
  let(:menu) {[{item: 5, name: "rice", price: 10}]}

  describe "#print_menu" do
    it "takes a menu as a array of hashes and returns it as a formatted string" do
      expect(subject.print_menu(menu)).to include("5. rice - 10")
    end
  end


end
describe Dishes do

  mock_list = [{dish: 'Hawaiian' , price: '8.99'}]
  subject(:dishes) { Dishes.new(menu = mock_list) }

  describe "#list" do

    it 'saves a list of menu items' do
      expect(dishes.menu).to all(be_a(Hash).and include(:dish).and include(:price))
    end

  end

  describe "#print" do

    it "pretty prints the menu" do
      expect{ dishes.print_menu}.to output("1. Hawaiian: £8.99\n").to_stdout
    end

  end

end

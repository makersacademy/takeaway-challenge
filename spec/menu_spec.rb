describe Menu do

  let(:mock_list) { [{dish: 'Hawaiian' , price: '8.99'}] }
  let(:invalid_dish) { 'Tortellini' }
  subject(:menu) { Menu.new(list = mock_list) }

  describe "#list" do

    it 'saves a list of menu items' do
      expect(menu.list).to all(be_a(Hash).and include(:dish).and include(:price))
    end

  end

  describe "#print" do

    it "pretty prints the menu" do
      expect{ menu.printed }.to output("1. Hawaiian: £8.99\n").to_stdout
    end

  end

  describe '#available?' do

    it 'returns false if dish is not in menu' do
      expect(menu.available?(invalid_dish)).to be false
    end

  end

end

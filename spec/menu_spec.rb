require 'menu'

describe 'menu' do
  let(:pizza) { double(:dish, name: "Pizza", price: BigDecimal(1.51, 4), to_s: "Pizza: £1.50") }
  let(:sushi) { double(:dish, name: "Sushi", price: BigDecimal(16, 4), to_s: "Sushi: £16.00") }
  let(:dishes) do
    {
      "Pizza" => pizza,
      "Sushi" => sushi
    }
  end
  let(:menu) { Menu.new(dishes)} 

  context '#available?' do
    it 'responds true for a dish which exists' do
      expect(menu.available?("Pizza")).to be true
    end
    it 'responds false for a dish which does not exist' do
      expect(menu.available?("This dish doesn't exist")).to be false
    end
  end

  context '#get' do
    it 'returns a dish when the dish exists' do
      expect(menu.get('Pizza')).to be pizza
    end

    it 'returns nil for a dish which does not exist' do
      expect(menu.get('This dish does not exist')).to be_nil
    end
  end

  context '#list' do
    it 'returns list of formatted dishes as a string' do
      expect(menu.list).to eq("Pizza: £1.50\nSushi: £16.00\n")
    end
  end

end
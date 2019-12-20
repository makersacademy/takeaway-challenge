require 'Takeaway'
describe Takeaway do
  describe '#see' do
    it {is_expected.to respond_to(:see).with(1).argument }

    it 'allows us to see menu with prices'do
    takeaway = Takeaway.new
    menu = Menu.new
    menu.add("salad",10)
    expect(takeaway.see(menu)).to eq [{"salad" => 10 }]
    end
  end
end

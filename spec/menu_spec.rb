require 'menu'

describe Menu do

subject(:menu) { described_class.new(meals) }

let(:meals) do {
  sprouts: 3.50, brocolli: 2.99
}
end


  describe '#print_menu' do
    it "it prints a list of meals with prices" do
      printed_menu = "Sprouts £3.50, Brocolli £2.99"
      expect(menu.print_menu).to eq printed_menu
    end


  end



end

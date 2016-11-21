require 'menu'

describe Menu do

  subject(:menu) {described_class.new(dishes)}
  let(:dishes) do {chicken: 3.50, burger: 4.90} end

  it 'has a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

  describe '#print' do

    it 'prints out the menu' do
      printed_menu = "Chicken £3.50, Burger £4.90"
      expect(subject.print).to eq printed_menu
    end

  end

  # describe '#does_not_contain?' do
  #
  #   it 'returns true when passed a dish not in the list' do
  #     expect(subject.does_not_contain?("Apples")).to eq true
  #   end
  #
  # end

end

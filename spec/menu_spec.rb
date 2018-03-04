require 'menu'

describe Menu do
  it 'return a list of dishes and prices' do
    actual = subject.dishes
    expected = {
      1 => ["prawn crackers", 1.99],
      2 => ["mini spring rolls", 3.49],
      3 => ["vagetable dumplings", 5.99],
      4 => ["chicken pad thai", 6.49] }
    expect(actual).to eq expected
  end

  describe '#read_menu' do
    it "show the list of the dishes and prices" do
      actual = subject.read_menu
      expected = [
        "1. prawn crackers £1.99",
        "2. mini spring rolls £3.49",
        "3. vagetable dumplings £5.99",
        "4. chicken pad thai £6.49"
      ].join("\n")
      expect(actual).to eq expected
    end
  end

end

require 'menu'

describe Menu do

  subject(:menu) { described_class.new({ "Onion Bhaji" => 2.50 }) }

  describe '#initialize' do
    it 'has a hash of dishes' do
      expect(menu.dishes.count).to eq 1
    end

    it 'should not be empty and should a Hash' do
      expect(menu.dishes).not_to be_empty and be_a_kind_of(Hash)
    end
  end

  describe '#print_dishes' do
    it 'can print a formatted string' do
      menu_print = "Onion Bhaji               2.50\n"
      expect { puts menu.print_dishes }.to output(menu_print).to_stdout
    end
  end
end

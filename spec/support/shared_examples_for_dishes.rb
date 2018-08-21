
shared_examples_for Dishes do

  subject(:dishes) { described_class.new }

  describe ".list" do
    it 'will display dishes and prices' do
      expect { dishes.list }.to output("Burger & Chips - £7\nDonner Kebab - £8\nMystery Curry - £9\nHoisin Duck Pancakes - £10\n").to_stdout
    end
  end
end
require_relative '../lib/order'

describe Order do

  it 'shows the menu properly' do
    hash_example = { dish: :price }
    subject = Order.new hash_example
    expect(subject.show_menu).to eq("#{:dish}, £ #{:price}\n")
  end

  describe '#order' do
    before(:each) do
      subject.add_order(:Cod, 2)
      total = subject.calculate_total
    end

    it 'adds a dish x times when ordered' do
      expect(subject.ordered_dishes[:Cod]).to eq 2
    end

    it 'calculates the total amount for the order' do
      total = subject.calculate_total
      expect(subject.calculate_total).to eq total
    end

    it 'shows the quantity of each dish and its price and the total amount' do
      total = subject.calculate_total
      str = "Cod, £ 5 * 2\nTotal amount: #{total}"
      expect(subject.verify_total).to eq(str)
    end
  end
end
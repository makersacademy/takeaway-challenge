require 'Takeaway'
describe Takeaway do
  describe '#see' do
    it {is_expected.to respond_to(:see).with(1).argument }

    it 'allows us to see list of dishes with prices'do
    takeaway = Takeaway.new
    salad = Dish.new(10)
    expect(takeaway.see(salad)).to eq 10
    end
  end
end

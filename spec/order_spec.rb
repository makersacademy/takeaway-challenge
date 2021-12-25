require 'order' 
describe Order do
  let(:dish) {"dal"}
  let(:quantity) {2}
  let(:price) {6.50}

  describe "#add" do 
  before do 
    subject.add(dish, quantity)
  end

    it 'adds dish name, price and quantity to basket' do
      expect(subject.basket).to include({name: dish, item_price: price, quantity: quantity, total_cost: quantity * price})
    end

    it 'increases basket_total by the total cost of dishes added' do 
    expect(subject.basket_total).to eq(quantity * price)
    end

    it 'raises error if user tries to add a dish not on the menu' do
      expect{ subject.add("pizza") }.to raise_error("That dish is not on our menu, please choose a dish from our menu.")
    end

  end

  it 'displays order' do 
    subject.add(dish, quantity)
    expect{ subject.display_order }.to output("Your order contains:\n2x dal = £13.0\nOrder total = £13.0\n").to_stdout 
  end

  it 'checks basket total' do 
    subject.add(dish, quantity)
    expect(subject.check_total?).to be(true)
  end  
  describe 'basket total check' do
    before do 
      allow(subject).to receive(:basket_total) { 1000 } #can't make this test pass... 
    end
    it 'is false when basket total has been calculated incorrectly' do
    expect(subject.check_total?).to be(false)
    end
  end

end
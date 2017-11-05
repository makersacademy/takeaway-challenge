require 'order'

describe Order do

  context 'Check if order has a balance' do
    it '#balance should show a balance' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(10)
      subject.update_order
      expect(subject.balance).to eq 20
  end
 end

  context 'Check amount paid equals to total amount' do
    it '#checkout should check whether price is right' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(10)
      subject.update_order
      expect(subject.checkout(18)).to eq ("Sorry, wrong amount for payment")
    end
    it '#checkout should give back change' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(10)
      subject.update_order
      expect(subject.checkout(21)).to eq ("Thanks! Here is $1 change")
    end
  end

end

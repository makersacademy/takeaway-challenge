require 'costumer'
describe Costumer do
  let(:menu) {double :menu, show: { cheese_burger: 5,
                                    hotdog:        4,
                                    lasagne:       5,
                                    beer:          2,
                                    coke:          2,
                                    cheese_cake:   3}}
  subject {Costumer.new(menu)}
  it 'has a basket' do
    expect(subject.basket).to eq({})
  end

  describe 'select' do
    it 'can select an item from a menu' do
      expect(subject.add(:cheese_burger)).to eq({cheese_burger: 5})
    end

    it 'can select multiple quantities from the same dish' do
      expect(subject.add(:cheese_burger,2)).to eq({cheese_burger: 10})
    end
  end

  describe 'total' do
    it 'returns the total' do
      subject.add(:cheese_burger,2)
      subject.add(:coke,2)
      expect(subject.total).to eq 14
    end


  end

  describe 'pay' do
    let(:fake_message) {double :fake_message}
    let(:client) {double :client, messages: fake_message}

    before(:each) {subject.add(:cheese_burger,2)
                   subject.add(:coke,2)}

    it 'returns an error when payment not equal to total' do
      expect{subject.pay(10)}.to raise_error 'Incorrect amount'
    end

    it 'sends a message if payment is correct' do
      expect(subject).to receive :send_message
      subject.total
      subject.pay(14)
    end
  end
end

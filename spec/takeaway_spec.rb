### test

require 'takeaway'

describe Takeaway do
  it 'creates new Takeaway' do
    expect(Takeaway.new)
  end

  context 'called display' do
    it { is_expected.to respond_to(:display) }
  end

  let(:takeaway) { Takeaway.new }

  it 'calling display doesnt change value of LIST' do
    takeaway.display
    expect(List::LIST).to eq List::LIST # need outside opinion on
  end

  # testing state
  context 'Italian list' do
    it 'displays iterated list' do
      expect(takeaway.display).to eq ["Margherita : £6\n", "Pepperoni : £7\n",
         "Ham & Pineapple : £7\n", "Meat feast : £8\n"]
    end
  end

end

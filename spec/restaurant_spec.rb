require 'customer'
require 'restaurant'

describe Restaurant do

  let (:customer) { double(:customer) }
  before(:example) do
    allow(customer).to receive(:select).and_return(true)
  end

  context 'Has a list of dishes' do

    it { is_expected.to respond_to (:dishes) }

    it 'upon creation' do
      expect(subject.dishes).to eq ( {
        :Rice=>1.5,
        :Naan=>2.0,
        :Vindaloo=>5.0
        } )
    end
  end

  context 'Cannot confirm' do
    it 'an empty order' do
      expect { subject.place_order(customer) }.to raise_error
    end
  end

  context 'Can send a confirmation' do

    it { is_expected.to respond_to (:place_order) }

    xit 'text of the order' do
      allow(customer).to receive(:order).and_return("Rice")
      allow(customer).to receive(:current_order).and_return(:order)
      customer.select("Rice", 1, subject)
      expect(subject.place_order(customer)).to be_truthy
    end
  end
end
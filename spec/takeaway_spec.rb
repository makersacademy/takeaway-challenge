require 'takeaway'

describe Takeaway do

  let(:name){ 'Burger' }
  let(:price){ 4.99 }
  let(:dish){ double('dish', name: name, price: price) }

  let(:menu_array){ [dish] }
  let(:menu_string){ '1'.ljust(10) + name.ljust(10) + price.to_s.rjust(6) + "\n" }

  let(:wrong_total_error){ Takeaway::WRONG_TOTAL_ERROR }

  subject(:takeaway){ Takeaway.new(menu_array) }

  context '#list_dishes' do
    it 'lists the available dishes' do
      expect(takeaway.list_dishes).to eq menu_string
    end
  end

  context '#add_to_order' do
    it 'adds two of a dish to the order' do
      takeaway.add_to_order(0, 2)
      expect(takeaway.order).to eq [[dish,2]]
    end
  end

  context '#place_order' do
    it 'raises error if user provided total does not equal order total' do
      takeaway.add_to_order(0,2)
      expect{ takeaway.place_order(price) }.to raise_error wrong_total_error
    end
  end

end

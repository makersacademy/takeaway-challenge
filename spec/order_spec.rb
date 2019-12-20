require 'order'

describe '#item_and_quantities' do
  it { is_expected.to respond_to(:item_and_quantities).with(2).argument }

  it 'can top up the balance' do
    expect { Takeaway.new.item_and_quantities("Chicken Korma", 4) }.to change{ subject.balance }.by 18

  end

end

require 'order'

describe Order do

  let(:new_dish) { double :dish }

  it { is_expected.to respond_to :dishes }

  it 'returns an empty array of dish when creating a new dish' do
    expect(subject.dishes).to eq []
  end

  it 'can have dishes added' do
    subject.add_dish(new_dish)
    expect(subject.dishes).to eq [new_dish]
  end

end

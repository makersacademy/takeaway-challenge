require 'menu'

describe Menu do

  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'contains dishes' do
    expect(subject.dishes[:lasagna]).to_not be_nil
  end

  context '#add_to_menu' do
    it 'can add items to menu' do
      subject.add_to_menu("IceCream", 4)
      expect(subject.dishes[:icecream]).to eq 4
    end
  end
end

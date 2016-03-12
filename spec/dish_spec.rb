require 'dish'

describe Dish do

  let(:curry){described_class.new(name: "Curry", price: 10)}

  it {expect(curry).to respond_to(:name, :price)}

  describe '#new curry' do
    it {expect(curry.name).to eq("Curry")}
    it {expect(curry.price).to eq(10)}
  end

end

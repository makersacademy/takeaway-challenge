require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:dish) { { name: name, price: price } }

  describe "#view" do
    it { is_expected.to respond_to(:view) }
  end

end

require 'menu'
require 'dish'

context Menu do
  let(:dish_number) { Integer.new }
  let(:dish_price) { Float.new }
  let(:dish_name) { String.new }

  before(:each) do
    @dish = Dish.new(:dish_number, :dish_price, :dish_name)
  end
  
  it { is_expected.to respond_to(:add).with(1).argument }

  describe '#add' do
    it 'returns dish added on success' do
      expect(subject.add(@dish)).to eq @dish
    end
  end

  it { is_expected.to respond_to(:get).with(1).argument }
  
end

require 'dishes'

RSpec.describe Dishes do
  let(:menu) { double :menu }
  let(:selection) { { name: :beef_curry, price: 5.70 } }
  let(:name) { :beef_curry }
  let(:quantity) { 2 }
  subject(:dishes) {  described_class.new }

  describe '#add' do
    it 'add hash of dishes to array' do
      dishes.add(name, quantity)
      expect(dishes.current_selection).to eq [{:name=>:beef_curry, :price=>5.7, :quantity=>2}]
    end
  end

end

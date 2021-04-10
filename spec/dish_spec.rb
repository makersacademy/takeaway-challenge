require 'dish'

describe Dish do

  subject(:katsu_curry) { described_class.new(:katsu_curry, 10, false) }
  subject(:yaki_soba) { described_class.new(:yaki_soba, 9) }

  context 'initializing dish' do
    it 'has a name' do
      expect(katsu_curry.name).to eq(:katsu_curry)
    end

    it 'has a price' do
      expect(katsu_curry.price).to eq(10)
    end

    it 'has an availability' do
      expect(katsu_curry.available).to eq(false)
    end

    it 'is available by default' do
      expect(yaki_soba.available).to eq(true)
    end
  end
end

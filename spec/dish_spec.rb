require './lib/dish'

describe Dish do
  let(:num) {1}
  subject {Dish.new num}

  it '#new dish number' do
    expect(subject.menu_id).to eq num
  end

  describe 'crud for dish' do
    it '#add name' do
      subject.name = 'Pizza'
      expect(subject.name).to eq 'Pizza'
    end
    it '#add price' do
      subject.price = 4.99
      expect(subject.price).to eq 4.99
    end
  end


end
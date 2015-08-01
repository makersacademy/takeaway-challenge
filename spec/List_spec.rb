require 'List'

describe List do
  let(:dish) { double(:dish, :name => :paella, :price => 15) }

  describe '#load_predefined_dishes'
  it 'creates a list of dishes with prices' do
    subject.load_predefined_dishes
    expect(subject.available).to have_at_least(5).dishes
  end

  describe '#add' do
    it 'new dish to the list' do
      subject.add_dish dish
      expect(subject.available).to include dish.name
    end
  end
end
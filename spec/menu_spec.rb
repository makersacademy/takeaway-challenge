require 'menu'
describe Menu do
# This class allows you to create and view dishes
let(:dish) {double(:dish)}
let(:name) {double(:name)}
let(:price) {double(:price)}
let(:created_dish) {{name: name, price: price}}

  describe '#dishes' do
    it 'contains some items initially' do
      expect(subject.dishes).not_to be_empty
    end
  end

  describe '#view' do
    it 'should return a list of dishes' do
      expect(subject.view).to eq(subject.dishes)
    end
  end

end

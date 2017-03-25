require 'menu'
describe Menu do
# This class allows you to create and view dishes
let(:dish) {double(:dish)}
let(:name) {double(:name)}
let(:price) {double(:price)}
let(:all_dishes) {{name: name, price: price}}

  describe '#dishes' do
    it 'is empty by default' do
      expect(subject.dishes).to be_empty
    end
  end

  describe '#create_dish' do
    it 'should create a dish with name and price' do
      expect(subject.create_dish(name, price)).to include(all_dishes)
    end
  end

  describe '#view' do
    it 'should return a list of dishes' do
      subject.create_dish(name, price)
      expect(subject.view).to eq([all_dishes])
    end
  end

end

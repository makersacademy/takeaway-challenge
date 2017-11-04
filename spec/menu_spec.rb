require 'menu'
describe Menu do
  it 'contains different dishes when initialized' do
    expect(subject.dishes).to be_an_instance_of Hash
  end
  describe '#read_menu' do
    it 'should show me the dishes' do
    end
  end
end

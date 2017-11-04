require 'menu'
describe Menu do
  context 'contains different dishes when initialized'
  it 'should initialize with a dishes variable' do
    expect(subject.dishes).to be_an_instance_of Array
  end
  it 'should contain dishes' do
    expect(subject.dishes).not_to be_empty
  end
  describe '#read_menu' do
    it 'should show me the dishes' do
      expect(subject.read_menu).to eq subject.dishes
    end
  end
end

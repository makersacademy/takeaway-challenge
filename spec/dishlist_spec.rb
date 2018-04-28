describe Dishlist do

  let(:dishlist_generator) { instance_double 'Dishlist_generator' }
  subject(:dishlist) { described_class.new(restaurant: 'Carluccios', dishlist_generator: dishlist_generator) }
  before { allow(dishlist_generator).to receive(:create_list).with(anything).and_return([]) }

  describe '#iinitialize' do

    it 'defaults to an empty list' do
      expect(subject.dishes).to be_empty
    end
    
  end

end

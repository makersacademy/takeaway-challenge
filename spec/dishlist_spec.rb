describe Dishlist do

  let(:dishlist_generator) { instance_double 'Dishlist_generator' }
  let(:test_value) { ["test"] }
  subject(:dishlist) { described_class.new(category: 'pizza', dishlist_generator: dishlist_generator) }
  before { allow(dishlist_generator).to receive(:create_list).with(anything).and_return(test_value) }

  describe '#dishes' do

    it 'returns a duplicate of the test value' do
      expect(subject.dishes).not_to be test_value
      expect(subject.dishes).to eq test_value
    end

  end

end

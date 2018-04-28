describe Menu_handler do

  describe '#initialize' do
    let(:menu_handler) { described_class.new('/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/resources')}

    it 'defaults the root' do
      expect(subject.instance_variable_get(:@root)).to eq described_class::ROOT
    end

    it 'initializes an array' do
      expect(subject.files).to be_an_instance_of(Array)
    end

    it 'defaults the root' do
      expect(menu_handler.instance_variable_get(:@root)).to eq '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/resources'
    end
  end

end

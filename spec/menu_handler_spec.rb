describe Menu_handler do
  let(:menu_handler) { described_class.new('/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources')}

  describe '#initialize' do

    it 'defaults the root' do
      expect(subject.instance_variable_get(:@root)).to eq described_class::ROOT
    end

    it 'initializes an array' do
      expect(subject.files).to be_an_instance_of(Array)
    end

    it 'sets the root' do
      expect(menu_handler.instance_variable_get(:@root)).to eq '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources'
    end

    it 'loads files' do
      expect(menu_handler.files.count).to eq 2
    end

  end

  describe '#get_summaries' do
    let(:summaries) { menu_handler.get_summaries }

    it 'returns an array of summaries' do
      p summaries
      expect(summaries).to be_an_instance_of(Array)
    end

    it 'returns the category of the menu' do
      expect(summaries[0][:category]).to eq "fake"
    end

    it 'returns the desription of the restaurant' do
      expect(summaries[0][:summary]).to eq "blank"
    end

    it 'only returns the descriptions that are defined with Description' do
      expect(summaries.count).to eq 1
    end

  end

end

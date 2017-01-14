require './lib/menu'

describe Menu do
  # subject(:menu_list) { described_class.new }

  # expect(subject.journeys).to include { {start: entry_station, end: exit_station} }


  describe '#menu_list' do
    it "is a hash of dishes with their prices" do
      # expect(subject.menu_list).to be_a hash
      expect(subject.menu_list).to include { {:choripan=>7.95} }
    end
  end

end

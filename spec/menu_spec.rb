require 'menu'

RSpec.describe Menu do

  let(:mains) { Menu::MAINS }
  let(:list) { subject.send(:sides_list) }

  describe '#list' do
    it 'prints a full list of available dishes' do
      expect(subject.show).to include list
    end
  end

end

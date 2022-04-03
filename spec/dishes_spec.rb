require_relative '../lib/dishes'

describe Dishes do
  context '#view_files' do
    xit 'Checks whether a string has been return' do
      expect(subject.view_menu).to be_an_instance_of(String)
    end
  end
end
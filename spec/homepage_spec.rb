require 'homepage'

describe Homepage do

  it 'creates a new instance of Homepage class' do
    expect(subject).to be_an_instance_of(Homepage)
  end

  describe '# display_restaurants' do
    it 'prints a list of restaurants' do
      expect(subject.display_restaurants).to be_an_instance_of(String)
    end

    # it 'should list restaurants with corresponding csv files' do
    #   ???
    # end
  end

  # describe '# find_restaurants' do
  #   it 'extracts the name of restaurants from the csv files available' do
  #     expect(subject.find_restaurants).to be_an_instance_of(Array)
  #   end
  # end
end
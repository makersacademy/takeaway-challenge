require './lib/Menu'

describe Menu do

    it 'entering food array class should display the menu' do 

      expect(subject.foods).to contain_exactly(["beef", 12], ["chicken", 7], ["lamb", 10])
    end

end

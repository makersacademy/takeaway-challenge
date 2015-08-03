require 'menu'

describe Menu do

	describe '.list' do
		xit 'show a table with heading of \'Dish Name\' and \'Price\'' do
		expect(subject.list).to eq Terminal::Table[:rows]
		end
	end
end
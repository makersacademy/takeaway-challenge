require 'menu'

describe Menu do
let (:menu){double(:menu)}

	it 'should store a menu' do
		expect(subject.menu_list).not_to be_empty
	end

end
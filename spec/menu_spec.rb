require 'menu'

describe Menu do
    it '#view_menu will return an array hash that is the menu' do
        expect(subject.view_menu).to be_a(Array)
    end 
end
require "menu.rb"

describe Menu do 

    it 'has an instance of the class menu' do
        expect(subject).to be_kind_of(Menu) 
    end

    it 'has a list_dishes method' do
        menu = Menu.new
        expect{ menu.list_dishes }.to output("misosoup:£6\nsashimi:£4\ntemaki:£7\n").to_stdout
    end 
    
end 
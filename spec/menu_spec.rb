require 'menu'

describe Menu do
    it '#view_menu will return the list of dishes available' do
        subject.add_dish("Fish",9)
        subject.add_dish("Korma",8)
        expect(subject.menu).to be_a(Array)
    end 

    it "#add dish will allow use to pick as many dishes as they want" do
        20.times {subject.add_dish("Korma",8)}
        expect(subject.menu.count).to eq 20
    end         

end
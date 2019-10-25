require "./lib/Menu"

describe Menu do

    it "Initialises a menu " do
        expect(subject.dish_list).to be_instance_of(Hash)
    end

end
require 'item'

describe Item do
    it 'initialises with 2 arguments' do
        item = Item.new(1, "name", 1)
        expect{item}.not_to raise_error
    end

end
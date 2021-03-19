require 'order'
require 'menu'

describe Order do
    let(:order) { double :order }

    before 'adds items to a menu' do
        subject.add("Burrata", 1)
        subject.add("Bruschetta", 1)
    end
    # it 'shows order when called' do
    #     expect(subject.show_order).to eq order
    # end 

    it 'selects several available dishes' do
        expect(subject.order).not_to be_empty
    end

    it 'total of order matches the total expected' do
        expect(subject.total).to eq 7.5
    end
end

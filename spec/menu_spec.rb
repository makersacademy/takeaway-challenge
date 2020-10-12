require 'menu'

describe Menu do
it 'will respond_to list_menu, order, view_order and confirm_totals' do
    expect(subject).to respond_to :list_menu
    expect(subject).to respond_to :order
    expect(subject).to respond_to :view_order
    expect(subject).to respond_to :confirm_totals
     end
 end


describe 'menu_choice' do
example 'Sets up an empty array' do
    expect([@menu_choice]).to eq [nil]
    end
end

describe 'list_menu' do
    it 'Lists menu items' do
    menu_list = Menu::MENU_LIST
    # subject.list_menu menu_list
    expect(menu_list).to eq [[1, "Pounded Yam", "5.00"],
    [2, "Okra Stew", "7.00"],
    [3, "Bitter Leaf Stew", "8.00"],
    [4, "Yam Porridge with Lamb pieces", "10.00"],
    [5, "Puff Puff", "4.00"],
    [6, "Chin Chin", "3.00"]]
    end
end

describe '#create_order' do
it "returns a line from stdin" do
    allow($stdin).to receive(:gets).and_return('foo')
    name = $stdin.gets
    expect(name).to eq('foo')
      end
end

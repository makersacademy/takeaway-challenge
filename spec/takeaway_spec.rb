require './lib/takeaway'

describe 'Takeaway' do

  it 'prints all the dishes and prices when calling view menu' do
    view_menu = { "Beef" => "£2.99" }
    expect(subject.view_menu).to eq(view_menu)
  end

end

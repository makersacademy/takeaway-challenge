require '/Users/admin/Library/Mobile Documents/com~apple~CloudDocs/takeaway-challenge/takeaway-challenge/docs/dishes.rb'
describe Dishes do
    it 'shows a list of dishes and their prices'
    expect(dishes.show_menu).to eq({'burger' => '£10.00', 'chips' => '£2.00', 'smoothie' => '£5.00', 'onion_rings' => '£4.00', 'mayo' => '£1.00', 'ketchup' => '£1.00'})
end
require 'menu'

describe Menu do

	subject(:menu) { described_class.new }
	let(:items) do 
				{
					"thing1" => 4.50,
				  "thing2" => 7.75
				}
				end	
  
  context 'content' do
    
    it { is_expected.to respond_to(:view_menu) }

    it 'has a list of menu items' do
      expect(menu.items).to include("thing1" => 4.50)
    end
      
    it 'shows a list of all items with prices' do
      expect(menu.view_menu).to eq(items.map{|k,v| "#{k}: £#{v.round(2)}"}.join(",\n"))
    end
  end
end

require 'menu'
Dir.chdir(File.dirname(__FILE__))
describe Menu do
  subject(:menu) {described_class.new}    #Default loaded with menu.csv
 
  it "responds to the load_menu method" do
    #This test requires menu.csv to exist in the root directory (rspec's working directory)
    expect(menu).to respond_to(:load_menu).with(1).argument    # No such file or directory @ rb_sysopen - menu.csv
  end
  
  it "returns true if the item is on the menu" do
    expect(menu.contains?("char sui bun")).to eq(true)
  end
  
  it "return a list of menu items" do
    expect { menu.read_menu }.to output(/fu-king fried rice/).to_stdout
  end

  it "return a the correct details" do
    expect(menu.get_details("fu-king fried rice")).to eq("fu-king fried rice"=>5.99)
  end

end




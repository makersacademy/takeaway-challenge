require 'menu'

describe Menu do
  let (:file_reader) { double("mock file reader") }
  let (:json_parser) { double("mock json parser") }
  let (:path_to_config) { "CONFIG_PATH" }
  subject { Menu.new(file_reader, json_parser, path_to_config) }

  describe '#initialize' do

    it 'should load menu from config file and store as array of hashes' do
      menu_json_data = "MENU_DATA"
      menu_hash_data = []

      allow(file_reader).to receive(:read).with(path_to_config).and_return(menu_json_data)
      allow(json_parser).to receive(:parse).with(menu_json_data).and_return(menu_hash_data)

      expect(subject.dishes).to eq(menu_hash_data)
    end

  end

end
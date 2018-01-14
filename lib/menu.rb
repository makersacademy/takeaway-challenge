require 'csv'

class Menu
  def initialize(menu_data: './data/menu_items.csv')
    @items = make_hash(menu_data)
  end

  def show
    items.clone
  end

  private

  attr_reader :items

  def make_hash(file_name)
    read_file = CSV.open(file_name, headers: true, header_converters: :symbol)
    read_file.to_a.map { |row| row.to_hash }
  end
end

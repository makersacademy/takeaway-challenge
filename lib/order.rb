require 'csv'

class Order
  def show_list
    read_csv
  end

  private
  attr_accessor :csv_data, :headers, :rows, :menu

  def read_csv
    self.csv_data = CSV.read("#{Dir.pwd}/lib/dishes.csv")
    parse_headers
    parse_rows
    merge_menu_hash
  end

  def parse_headers
    self.headers = csv_data.shift.map { |header| header.to_s }
  end

  def parse_rows
    self.rows = csv_data.map { |row| row.map { |cell| cell.to_s } }
  end

  def merge_menu_hash
    self.menu = rows.map { |row| Hash[*headers.zip(row).flatten] }
  end

end

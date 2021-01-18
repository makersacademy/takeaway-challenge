require 'csv'

conf.echo = false

class Menu

  attr_reader :menu, :col_width

  def initialize
    @file = './lib/menu.csv'
    load_file
  end

  def load_file
    @keys = [:name, :description, :price, :category]
    @menu = CSV.parse(File.read(@file)).map { |row| Hash[@keys.zip(row)] }
    sort_table
  end

  def sort_table
    @menu = @menu.sort_by!{ |row| [row[:category], row[:name]] }
  end

  def col_width
    table = CSV.parse(File.read(@file))
    @col_width = table.transpose.map { |col| col.map{ |cell| cell.to_s.length}.max }
  end

  def print
    @menu.clone
  end

  def lookup_item(index)
    @menu[index]
  end

end

class MenuPrinter
  def self.print_menu(args)
    #extract args into items and column details
    @@items = args[:items]
    @@columns = args[:headers].each_with_object({}) { |(header,label), hash|
      hash[header] = { label: label, width: [args[:items].map {|item| item[header].to_s.length}.max, label.length].max } }
    #return pretty string
    write_divider + write_header + write_divider + write_items + write_divider
  end

  private

  def self.write_header
    "| #{ @@columns.map { |_, header| header[:label].ljust(header[:width]) }.join(' | ') } |\n"
  end

  def self.write_divider
    "+-#{ @@columns.map { |_, header| "-" * header[:width] }.join("-+-") }-+\n"
  end

  def self.write_items
    @@items.map { |item| write_line(item) }.join('')
  end

  def self.write_line(item)
    "| #{ item.keys.map { |key| item[key].to_s.ljust(@@columns[key][:width]) }.join(" | ") } |\n"
  end
end

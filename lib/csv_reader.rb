class CsvReader

  attr_reader :menu

  def initialize(file:)
    @file_path = file
    read_file
  end

  private
  attr_reader :file_path, :file

  def read_file
    raise 'File not found' unless File.exist?(file_path)
    @file = File.open(file_path, "r")
    parse_menu
  end

  def parse_menu
    @menu = Hash.new
    file.each_line do |line|
      fields = line.split(',')
      @menu.store(fields[0], fields[1].strip.to_f)
    end
  end

end

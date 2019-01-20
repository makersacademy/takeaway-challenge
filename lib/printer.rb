class Printer

  def self.print_nicely(array_hash)
    @array_hash = array_hash
    set_headers
    @array_hash.each { |e| @output += "#{e[@key1]}".ljust(20,' ') + "#{e[@key2]}\n" }
    @output
  end

private

  def self.set_headers
    @keys = @array_hash[0].keys
    @key1 = @keys[0]
    @key2 = @keys[1]
    @output = "#{@key1}".ljust(20,' ') + "#{@key2}\n"
  end

end

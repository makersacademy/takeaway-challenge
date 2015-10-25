require 'dish'
class MenuLoader
  def initialize
    @objects = []
  end
  def load(file)
    fail "Data File missing!" if !File.exists? file
    $/="\n\n"
    File.open(file, "r").each do |object|
        @objects << YAML::load(object)
    end
  end
  def objects
    @objects.dup
  end
end

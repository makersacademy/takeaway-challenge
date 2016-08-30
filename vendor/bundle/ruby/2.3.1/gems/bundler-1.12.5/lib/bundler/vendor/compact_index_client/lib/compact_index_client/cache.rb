# frozen_string_literal: true
class Bundler::CompactIndexClient
  class Cache
    attr_reader :directory

    def initialize(directory)
      @directory = Pathname.new(directory).expand_path
      FileUtils.mkdir_p info_path(nil)
    end

    def names
      lines(names_path)
    end

    def names_path
      directory.join("names")
    end

    def versions
      versions_by_name = Hash.new {|hash, key| hash[key] = [] }
      info_checksums_by_name = {}

      lines(versions_path).each do |line|
        name, versions_string, info_checksum = line.split(" ", 3)
        info_checksums_by_name[name] = info_checksum || ""
        versions_string.split(",").each do |version|
          if version.start_with?("-")
            version = version[1..-1].split("-", 2).unshift(name)
            versions_by_name[name].delete(version)
          else
            version = version.split("-", 2).unshift(name)
            versions_by_name[name] << version
          end
        end
      end

      [versions_by_name, info_checksums_by_name]
    end

    def versions_path
      directory.join("versions")
    end

    def checksums
      checksums = {}

      lines(versions_path).each do |line|
        name, _, checksum = line.split(" ", 3)
        checksums[name] = checksum
      end

      checksums
    end

    def dependencies(name)
      lines(info_path(name)).map do |line|
        parse_gem(line)
      end
    end

    def info_path(name)
      directory.join("info", name.to_s)
    end

    def specific_dependency(name, version, platform)
      pattern = [version, platform].compact.join("-")
      return nil if pattern.empty?

      gem_lines = info_path(name).read
      gem_line = gem_lines[/^#{Regexp.escape(pattern)}\b.*/, 0]
      gem_line ? parse_gem(gem_line) : nil
    end

  private

    def lines(path)
      return [] unless path.file?
      lines = path.read.split("\n")
      header = lines.index("---")
      lines = header ? lines[header + 1..-1] : lines
    end

    def parse_gem(string)
      version_and_platform, rest = string.split(" ", 2)
      version, platform = version_and_platform.split("-", 2)
      dependencies, requirements = rest.split("|", 2).map {|s| s.split(",") } if rest
      dependencies = dependencies ? dependencies.map {|d| parse_dependency(d) } : []
      requirements = requirements ? requirements.map {|r| parse_dependency(r) } : []
      [version, platform, dependencies, requirements]
    end

    def parse_dependency(string)
      dependency = string.split(":")
      dependency[-1] = dependency[-1].split("&") if dependency.size > 1
      dependency
    end
  end
end

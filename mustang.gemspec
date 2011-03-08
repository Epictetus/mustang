# -*- ruby -*-

begin
  Ore::Specification.new do |gemspec|
    gemspec.files += `git ls-files`
    gemspec.extensions << "ext/engine/extconf.rb"
    gemspec.require_paths = ["lib", "ext"]
  end
rescue NameError
  begin
    require 'ore/specification'
    retry
  rescue LoadError
    STDERR.puts "The '#{__FILE__}' file requires Ore."
    STDERR.puts "Run `gem install ore-core` to install Ore."
  end
end

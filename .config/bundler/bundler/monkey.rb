
begin
  require 'bundler/settings'
rescue LoadError
  puts "Run \e[35m`gem install bundler`\e[0m to install bundler."
  exit 1
end

module Bundler
  class Settings
    def path
      key  = key_for(:path)
      path = ENV[key]
      return path if path && !@local_config.key?(key)

      if path = self[:path] || @global_config[key]
        "#{path}/#{Bundler.ruby_scope}"
      else
        Bundler.rubygems.gem_dir
      end
    end
  end
end

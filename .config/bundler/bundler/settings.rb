
require Gem.find_files('bundler/settings')[1]

class Bundler::Settings
  def path
    key  = key_for(:path)
    path = ENV[key]
    return path if path && !@local_config.key?(key)

    if path = self[:path] || @global_config[key]
      # you should respect ruby_scope with @global_config too
      "#{path}/#{Bundler.ruby_scope}"
    else
      Bundler.rubygems.gem_dir
    end
  end
end

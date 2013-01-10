
require Gem.find_files('bundler/runtime')[1]

class Bundler::Runtime
  def setup_environment
    # please don't mess up my environment with RUBYOPT, BUNDLE_GEMFILE, etc
  end
end

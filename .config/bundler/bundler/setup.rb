
rubyopt = ENV['RUBYOPT']
require 'bundler/monkey'
require Gem.find_files('bundler/setup')[1]
ENV['RUBYOPT'] = rubyopt

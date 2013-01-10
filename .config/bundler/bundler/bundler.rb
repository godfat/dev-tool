
rubyopt = ENV['RUBYOPT']
require 'bundler/monkey'
require Gem.find_files('bundler')[1]
ENV['RUBYOPT'] = rubyopt

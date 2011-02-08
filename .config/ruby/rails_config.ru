
ENV['RAILS_ENV'] = ENV['RACK_ENV'] if ENV['RACK_ENV']

require Dir.pwd + '/config/environment'

use Rails::Rack::LogTailer

if defined?(ActionDispatch::Static)
  use ActionDispatch::Static
else
  use Rails::Rack::Static
end

run ActionController::Dispatcher.new

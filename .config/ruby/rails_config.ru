
require Dir.pwd + '/config/environment'

use Rails::Rack::LogTailer

if defined?(ActionDispatch::Static)
  use ActionDispatch::Static
else
  use Rails::Rack::Static
end

run ActionController::Dispatcher.new

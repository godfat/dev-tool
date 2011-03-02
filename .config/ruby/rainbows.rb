
# Thread.new{ load '~/bin/gemfile' }

worker_processes 2

Rainbows! do
  use :EventMachine
end

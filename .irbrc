# Some default enhancements/settings for IRB, based on
# http://wiki.rubygarden.org/Ruby/page/show/Irb/TipsAndTricks

# Activate auto-completion.
require 'irb/completion'

# Use the simple prompt if possible.
IRB.conf[:PROMPT_MODE] = :SIMPLE if IRB.conf[:PROMPT_MODE] == :DEFAULT

# Setup permanent history.
history_path = '~/.config/irb/irb_history'
history_size = 100

begin
  history_path = File.expand_path(history_path)

  if File.exist?(history_path)
    lines = File.read(history_path).lines.map(&:chop)
    puts "Read #{lines.size} saved history commands from '#{history_path}'." if IRB.conf[:VERBOSE]
    Readline::HISTORY.push(*lines)

  else
    puts "History file '#{history_path}' was empty or non-existant, creating." if IRB.conf[:VERBOSE]
    require 'fileutils'
    FileUtils.mkdir_p(File.dirname(history_path))
  end

  Kernel.at_exit do
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = lines[-history_size, history_size] if lines.size > history_size
    puts "Saving #{lines.size} history lines to '#{history_path}'." if IRB.conf[:VERBOSE]
    File.open(history_path, 'w'){ |file| file.puts(lines.join("\n")) }
    File.chmod(0600, history_path)
  end

rescue => e
  puts "Error when configuring permanent history: #{e}" if IRB.conf[:VERBOSE]
end

#!/usr/bin/env ruby

module Prompt
  module_function
  def which_shell
    if ENV['PROMPT_SHELL']
      'fish'
    else
      ENV['SHELL'][/\w+$/]
    end
  end

  def prompt_char
    case which_shell
      when 'fish'; '>'
      when 'bash'; '$'
      else       ; '%'
    end
  end

  def prompt
    "#{gray256{time}} #{color256(22){where}}"  \
    "#{green{cwd}}#{cyan{git}}#{prompt_char} "
  end

  def time
    Time.now.strftime('%H:%M')
  end

  def where
    if ENV['PROMPT_HOST']
      require 'socket'
      require 'etc'
      "#{Etc.getlogin}@#{Socket.gethostname} "
    else
      ''
    end
  end

  def cwd
    if ENV['PROMPT_PATH_ABBR']
      Dir.pwd.sub(/^#{ENV['HOME']}/, '~').gsub(/(\w).*?\//, '\1/')
    else
      Dir.pwd
    end
  end

  def git
    if hide? then dirty else dirty_branch end
  end

  # utility

  def   black &block; color(30, &block); end
  def     red &block; color(31, &block); end
  def   green &block; color(32, &block); end
  def  yellow &block; color(33, &block); end
  def    blue &block; color(34, &block); end
  def magenta &block; color(35, &block); end
  def    cyan &block; color(36, &block); end
  def   white &block; color(37, &block); end
  def   reset &block; color('', &block); end

  def color rgb, &block
    color_code("\e[#{rgb}m", &block)
  end

  def green256 &block; color256(  2, &block); end
  def  cyan256 &block; color256(  6, &block); end
  def  gray256 &block; color256(102, &block); end

  def color256 rgb, &block
    color_code("\e[38;5;#{rgb}m", &block)
  end

  # private

  def color_code code
    c = case which_shell
          when 'bash'; "\\[#{code}\\]"
          else       ;       code
        end

    if block_given?
      "#{c}#{yield}#{reset}"
    else
      c
    end
  end

  def hide?
    `git config --get prompt.hide`.strip == 'true'
  end

  def dirty_branch
    (s = dirty + branch).empty? ? '' : " #{s}"
  end

  # A: added
  # M: modified
  # D: deleted
  # R: renamed
  # T: typechanged
  # C: copied
  def dirty
    case `git status --porcelain 2> /dev/null`
      when ''
        ''   # clean
      when /\A(^[AMDRTC]  [^\n]+\n)+\Z/
        '#' # all staged
      else
        '*' # dirty
    end
  end

  def branch
    return '' if (branch = `git branch 2> /dev/null`).empty?
    branch.match(/\* (.+)/)[1]
  end
end

print Prompt.prompt if $PROGRAM_NAME == __FILE__

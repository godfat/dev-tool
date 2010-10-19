#!/usr/bin/env ruby

module Prompt
  module_function
  def prompt_full
    "#{gray256{time}} #{color256(22){where}}#{green{cwd}}#{cyan{git}}$"
  end

  def prompt
    "#{white{time}} #{green{cwd}}#{cyan{git}}$"
  end

  def time
    Time.now.strftime('%H:%M')
  end

  def where
    if ENV['PROMPT_HOST']
      require 'socket'
      require 'etc'
      "#{Etc.getlogin}@#{Socket.gethostname} "
    end
  end

  def cwd
    Dir.pwd.sub(/^#{ENV['HOME']}/, '~').gsub(/(\w).*?\//, '\1/')
  end

  def git
    hide? ? dirty : dirty_branch
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

  def color rgb
    "\x1b[#{rgb}m" + (block_given? ? "#{yield}#{reset}" : '')
  end

  def green256 &block; color256(  2, &block); end
  def  cyan256 &block; color256(  6, &block); end
  def  gray256 &block; color256(102, &block); end

  def color256 rgb
    "\x1b[38;5;#{rgb}m" + (block_given? ? "#{yield}#{reset}" : '')
  end

  # private

  def hide?
    `git config --get prompt.hide`.strip == 'true'
  end

  def dirty_branch
    (s = dirty + branch).empty? ? '' : " #{s}"
  end

  def dirty
    case `git status --porcelain 2> /dev/null`
      when ''
        ''   # clean
      when /\A(^[AMDRT]  [^\n]+\n)+\Z/
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

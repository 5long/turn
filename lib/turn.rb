#
module Turn
end

require 'fileutils'

require 'turn/version'
require 'turn/autoload'
require 'turn/configuration'
require 'turn/colorize'
require 'turn/components'
require 'turn/controller'
require 'turn/minitest'

#if ENV['autorun']
#  warn "Use `require 'turn/autorun'` instead of `require 'turn'` for future versions."
#  MiniTest::Unit.autorun
#end


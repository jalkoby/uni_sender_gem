require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'lib/uni_sender'
require "spec/data_macros"

RSpec.configure do |config|

  config.include(DataMacros)

end

require "bundler"
Bundler.require

require "active_support/all"

Dir.glob("slides/*.rb").each do |file|
  load file
end

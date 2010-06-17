require "rubygems"
require "sinatra"
require "cowserv"

set :run, false
set :environment, :production
set :cowsay, "/usr/games/cowsay"

FileUtils.mkdir_p "log" unless File.exists?("log")
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application

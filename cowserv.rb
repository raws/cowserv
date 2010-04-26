#!/usr/bin/env ruby

require "erb"
require "open3"

require "rubygems"
require "sinatra"

COWSAY_OPTIONS = %w(f b d g p s t w y e T W)

set :environment, :production
set :port, 9876

get "/" do
  if params[:message]
    cowsay(params[:message], extract_cowsay_options(params))
  else
    erb :index
  end
end

post "/" do
  cowsay(params[:message], extract_cowsay_options(params)) if params[:message]
end

get "/list" do
  read("cowsay -l").split("\n")[1..-1].join(" ").split(/\s+/).join("\n")
end

helpers do
  def link(path)
    url = "http://#{request.host}#{request.port != 80 ? ":" + request.port.to_s : ""}/#{path}"
    "<a href=\"#{url}\">#{url}</a>"
  end
  
  def extract_cowsay_options(params)
    params.find_all { |key, val| COWSAY_OPTIONS.include?(key) }
  end

  def escape(text)
    text.gsub("`", "\\`")
  end

  def read(command)
    Open3.popen3(command)[1].read
  end

  def cowsay(message, options = [])
    command = "cowsay "
    command << options.collect do |key, val|
      "-#{key}" + (val.nil? ? "" : " \"#{escape(val)}\"")
    end.join(" ") + " "
    command << "\"#{escape(message)}\""

    read(command)
  end
end

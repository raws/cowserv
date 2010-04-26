#!/usr/bin/env ruby

require "rubygems"
require "sinatra"
require "erb"

COWSAY_OPTIONS = %w(f b d g p s t w y e T W)

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
  `cowsay -l`.split("\n")[1..-1].join(" ").split(/\s+/).join("\n")
end

helpers do
  def extract_cowsay_options(params)
    params.find_all { |key, val| COWSAY_OPTIONS.include?(key) }
  end
  
  def escape(text)
    text.gsub("`", "\\`")
  end
  
  def cowsay(message, options = [])
    command = "cowsay "
    command << options.collect do |key, val|
      "-#{key}" + (val.nil? ? "" : " \"#{escape(val)}\"")
    end.join(" ") + " "
    command << "\"#{escape(message)}\""
    puts command
    `#{command}`
  end
  
  def link(path)
    base_url = "http://#{request.host}#{request.port != 80 ? ":" + request.port.to_s : ""}/"
    url = base_url + path
    "<a href=\"#{url}\">#{url}</a>"
  end
end

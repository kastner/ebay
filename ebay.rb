$:.unshift "sinatra/lib"

require 'rubygems'
require 'sinatra'

before do
  # set UTF-8
  header "Content-Type" => "text/html; charset=utf-8"

  # set css body id
  @body_id = "home"  
end

get "/" do
  erb :index
end

$:.unshift "sinatra/lib"

require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'json'
require 'cgi'
require 'ebay-private'

before do
  # set UTF-8
  header "Content-Type" => "text/html; charset=utf-8"

  # set css body id
  @body_id = "home"  
end

get "/" do
  erb :index
end

get "/search" do
  url = "http://open.api.ebay.com/shopping?appid=#{EBAY_APP_ID}&version=517&siteid=0&callname=FindItems&QueryKeywords=#{CGI.escape(params["q"])}&responseencoding=JSON"
  json_response = open(url).read
  result = JSON.parse(json_response)
  @items = result["Item"]
  erb :search
end

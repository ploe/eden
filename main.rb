#! /usr/bin/ruby

require 'rubygems'
require 'bundler/setup'

require 'sinatra'

path = {}

path[:crud] = "./crud"
path[:create] = "#{path[:crud]}/create"
path[:read] = "#{path[:crud]}/read"
path[:update] = "#{path[:crud]}/update"
path[:delete] = "#{path[:crud]}/delete"

# Create
post '/*' do
	src = "#{path[:create]}/#{request.path_info}"
end

class EdenRead

def initialize(path)
	@path = "#{path[:read]}/#{request.path_info}"
	src = File.read(@path)
	@path
end

end

# Read
get '/*' do
	EdenRead.new(path)
end

# Update
put '/*' do
	src = "#{path[:update]}/#{request.path_info}"
end

# Delete
delete '/*' do
	src = "#{path[:delete]}/#{request.path_info}"
end

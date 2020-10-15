# frozen_string_literal: true

require './app/classes/parse_file.rb'

ARGV.each do |file_name|
  ParseFile.new(file_name)
end

puts "Hasta la vista"

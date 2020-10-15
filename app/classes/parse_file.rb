# frozen_string_literal: true

class ParseFile

  attr_accessor :file

  def initialize(file_name: "")
    @file = open_file(file_name)
  end

  def print_results
  end

  private

  def open_file(file_name)
    begin
      File.open(File.expand_path("../../"+file_name, File.dirname(__FILE__)))
    rescue
      puts "Unable to open file"
    end
  end

end

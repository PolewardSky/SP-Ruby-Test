# frozen_string_literal: true

# Receive and parse file outputs
class ParseFile
  attr_accessor :file_name, :file_data

  def initialize(file_name: '')
    @file_name = file_name
  end

  def load_file
    parse_file
  end

  def order_data_by_page_views
    @file_data.sort_by { |_x, y| y.uniq.size }.reverse.map { |x, y| "#{x} #{y.uniq.size} unique views" }
  end

  private

  def parse_file
    @file_data = {}

    File.foreach(File.expand_path('../../' + file_name, File.dirname(__FILE__))) do |line|
      line_split = line.split(' ')
      url = @file_data[(line_split[0]).to_s] ||= []

      url.push(line_split[1])
    end
  end
end

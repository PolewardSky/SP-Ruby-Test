# frozen_string_literal: true

require './app/classes/parse_file.rb'

describe ParseFile do
  it 'creates object' do
    expect(ParseFile.new).to have_attributes({})
  end

end

# frozen_string_literal: true

require './app/classes/parse_file.rb'

describe ParseFile do

  it 'creates object' do
    subject { ParseFile.new }

    expect(subject).to have_attributes({})
  end

  it 'takes a file name' do 
    subject { ParseFile.new("app/files/webserver.log") }

    expect(subject.file).not_to eq(nil)
  end

end

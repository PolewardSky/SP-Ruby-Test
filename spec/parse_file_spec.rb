# frozen_string_literal: true

require './app/classes/parse_file.rb'

describe ParseFile do
  let(:parse_file) { ParseFile.new(file_name: 'app/files/webserver.log') }
  let(:parse_invalid_file) { ParseFile.new(file_name: 'app/files/webserver123123.log') }

  it 'creates object' do
    expect(subject).to have_attributes({})
  end

  it 'takes a file name' do
    expect(parse_file.file_name).to eq('app/files/webserver.log')
  end

  it 'loads a file' do
    parse_file.load_file
    expect(parse_file.file_data).to_not eq(nil)
  end

  it 'loads a invalid file' do
    parse_invalid_file.load_file
    expect(parse_file.file_data).to eq(nil)
  end

  it 'orders data by page views' do
    parse_file.load_file
    expect(parse_file.order_data_by_page_views).to eq(['/index 23 unique views',
                                                       '/home 23 unique views',
                                                       '/contact 23 unique views',
                                                       '/help_page/1 23 unique views',
                                                       '/about/2 22 unique views',
                                                       '/about 21 unique views'])
  end

  it 'loads a invalid file and orders data by page views' do
    parse_invalid_file.load_file
    expect(parse_file.order_data_by_page_views).to eq(nil)
  end
end

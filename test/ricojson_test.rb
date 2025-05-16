require 'minitest/autorun'
require 'ricojson'
require 'stringio'

describe RicoJSON do
  before do
    @json = '{"name": "Abed Nadir", "timeline": "Not the darkest one"}'
    @pretty_json = <<-EOS
{
  \"name\": \"Abed Nadir\",
  \"timeline\": \"Not the darkest one\"
}
EOS
    # Capture STDOUT
    $stdout = StringIO.new
  end

  it 'sould return a pretty JSON' do
    RicoJSON.read_string(@json)
    _($stdout.string).must_equal @pretty_json
  end

  it 'should receive a json file and prettify it' do
    file = Tempfile.new(['json', '.json'])
    file.write(@json)
    file.close

    RicoJSON.read_file(file)
    _($stdout.string).must_equal @pretty_json
  end

  it 'should accept spaces as filenames' do
    file = File.new('/tmp/test\ this\ file', 'w+')
    file.write(@json)
    file.close
    RicoJSON.read_file(file)
    _($stdout.string).must_equal @pretty_json
  end
end

require 'minitest/spec'
require 'minitest/autorun'
require 'ricojson'
require 'stringio'

describe RicoJSON do

  it 'sould return a pretty JSON' do
    json = '{"name": "Abed Nadir", "timeline": "Not the darkest one"}'
    pretty_json = <<-EOS
{
  \"name\": \"Abed Nadir\",
  \"timeline\": \"Not the darkest one\"
}
EOS
    $stdout = StringIO.new
    RicoJSON.read_string(json)
    $stdout.string.must_equal pretty_json
  end

end

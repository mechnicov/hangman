if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# require 'unicode_utils'
require_relative 'lib/reader'
require_relative 'lib/writer'

words_path = "#{__dir__}/data/words.txt"
reader = Reader.new
writer = Writer.new(reader)

writer.write_to_file(words_path)
puts 'Словарь компьютера успешно обновлён'
exit

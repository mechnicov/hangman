if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# require 'unicode_utils'
require 'colorize'
require_relative 'lib/game'
require_relative 'lib/printer'
require_relative 'lib/reader'
require_relative 'lib/writer'

words_path = "#{__dir__}/data/words.txt"
user_input = nil
until %w(о з).include? user_input
  puts "\n(О)тгадать слово, загаданное компьютером" \
       "\n(З)агадать слово для второго игрока".colorize(:blue)
  print "\nВаш выбор: "
  user_input = STDIN.gets.chomp.downcase
end

reader = Reader.new

word = if user_input == 'о'
         reader.words_from_file(words_path).sample
       else
         reader.word_from_console
       end

game    = Game.new(word)
printer = Printer.new(game)
printer.cls
printer.intro

sleep 2

while game.in_progress?
  printer.print_status(game)
  game.ask_letter
end

printer.print_status(game)

sleep 4
printer.cls

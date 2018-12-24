require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'

current_path = __dir__

reader = WordReader.new
word = reader.read_from_file(current_path + '/data/words.txt')
game = Game.new(word)

printer = ResultPrinter.new(game)
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

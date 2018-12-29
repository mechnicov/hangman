require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'

current_path = __dir__
game_mode    = nil
until %w(к п).include? game_mode
  STDOUT.puts "Кто будет загадывать слово?\n(К)омпьютер\n(П)ользователь"
  game_mode = gets.chomp.downcase
end

reader = WordReader.new
word   = if game_mode == 'к'
           reader.read_from_file(current_path + '/data/words.txt')
         else
           reader.read_from_console
         end

game    = Game.new(word)
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

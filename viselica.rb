begin
  require_relative 'game'
  require_relative 'result_printer'
  require_relative 'word_reader'
rescue LoadError
  abort 'Файлы программы повреждены'
end

current_path = File.dirname(__FILE__)

printer = ResultPrinter.new
printer.cls

begin
  file = File.new(current_path + '/data/intro.txt')
  intro = file.read
  file.close
  STDOUT.puts "\n" * 10, intro
rescue SystemCallError
  STDOUT.puts "\n" * 10, 'Виселица'
end

sleep 2

reader = WordReader.new
slovo = reader.read_from_file(current_path + '/data/words.txt')
game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_letter
end

printer.print_status(game)

sleep 4
printer.cls

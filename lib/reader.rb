require 'io/console'

class Reader
  def words_from_file(path)
    File.readlines(path, chomp: true)
  end

  def word_from_console
    print 'Загадывайте слово (буквы не будут видны) > '
    STDIN.noecho(&:gets).chomp
  end
end

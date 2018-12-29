require 'io/console'
class WordReader
  def read_from_file(path)
    return nil unless File.exist?(path)

    lines = File.readlines(path, chomp: true)
    return nil if lines.empty?

    lines.sample
  end

  def read_from_console
    STDOUT.print 'Загадывайте слово (буквы не будут видны) > '
    STDIN.noecho(&:gets).chomp
  end
end

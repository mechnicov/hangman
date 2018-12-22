# Класс, отвечающий за выбор слова из списка
class WordReader
  def read_from_file(file_name)
    file = File.new(file_name)
    lines = file.readlines
    file.close
    return nil if lines.empty?
    lines.sample.chomp
  end
end

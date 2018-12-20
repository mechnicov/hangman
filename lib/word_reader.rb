# Класс, отвечающий за выбор слова из списка
class WordReader
  def read_from_file(file_name)
    raise 'Отсутствует база данных со словами.' unless File.exist?(file_name)
    file = File.new(file_name)
    lines = file.readlines
    file.close
    raise 'Отсутствуют слова в базе данных.' if lines.empty?
    lines.sample.chomp
  end
end

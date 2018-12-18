class WordReader
  def read_from_file(file_name)
    begin
      file = File.new(file_name)
      lines = file.readlines
      file.close
      lines.sample.chomp
    rescue SystemCallError
      abort 'Отсутствует база данных со словами'
    rescue NoMethodError
      abort 'База данных пустая'
    end
  end
end

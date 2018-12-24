class WordReader
  def read_from_file(path)
    return nil unless File.exist?(path)

    lines = File.readlines(path, chomp: true)
    return nil if lines.empty?

    lines.sample
  end
end

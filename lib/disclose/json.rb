# JSON
module Disclose
  require 'json'

  class << self
    def json_write(filename, content)
      json = JSON.pretty_generate content
      File.open(filename, 'w') { |f| f.puts(json) }
    end
  end # end class
end

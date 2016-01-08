# CLI
module Disclose
  require 'disclose/json'
  require 'disclose/github'
  require 'disclose/parse'
  require 'disclose/version'

  JSON_FILENAME = 'licenses.json'
  OPTION_HTML = 'html'

  class << self
    def cli
      o_html = "--#{OPTION_HTML}"

      if ARGV.count == 0
        puts PROJECT_DESCRIPTION
        puts "Usage: #{PROJECT_NAME} <file> [#{o_html}]"
        puts "       #{o_html} Request license in HTML format"
        exit
      end

      filename = ARGV[0]
      unless File.exist? filename
        puts "#{filename} does not exist"
        exit 1
      end

      html = ARGV.include? o_html
      puts "License format: #{html ? 'HTML' : 'text'}"

      puts "Scanning for GitHub repos in #{filename}, found..."
      content = File.read(filename)

      parsed = parse_repos content

      licenses = github_licenses hash: parsed, html: html

      puts "Writing to #{JSON_FILENAME}"
      json_write JSON_FILENAME, licenses
    end
  end # end class
end

# GitHub
module Disclose
  require 'netrc'
  require 'octokit'

  GITHUB_APP_HTML = 'application/vnd.github.html'
  UTF8 = 'utf-8'

  class << self
    def github_lic_text(client, repo)
      response = client.repository_license_contents repo
      content = response['content']
      Base64.decode64(content)
    end

    # request html license (supress licenses api error)
    def github_lic_html(client, repo)
      client.repository_license_contents repo, accept: GITHUB_APP_HTML
    end

    def github_licenses(hash: nil, html: false)
      client = Octokit::Client.new(netrc: true)

      hash.each do |r|
        repo = r[:project]
        puts "Retrieving license for #{repo}"
        begin
          content =
            if html
              github_lic_html client, repo
            else
              github_lic_text client, repo
            end

          if content.nil?
            puts "> Error: license missing for #{r}"
            r[:error] = 'No license content'
          else
            encoded = content.force_encoding UTF8
            r[:license] = encoded
            r[:error] = nil
          end
        rescue => e
          puts "> Error: #{e}"
          r[:error] = e
        end # end begin
      end # end c.each

      hash
    end
  end # end class
end

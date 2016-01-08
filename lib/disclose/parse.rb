# Parse
module Disclose
  class << self
    def parse_repos(c)
      c.split(/\n/).reject { |x| (x.length == 0) || !(x.include? 'github') }
        .map do |z|
          z = z.match /http.*/
          z = z[0].strip
          project = z.sub 'https://github.com/', ''
          {
            project: project,
            url: z
          }
        end
    end
  end # end class
end

module Nesta
  module Plugin
    module Sluggable
      module Helpers
        # If your plugin needs any helper methods, add them here...
      end

      SLUGGED_FORMAT = /^\d+$/

      def self.resolve_path(path)
        segments = path.split('/')
        path = segments[0..-2].join('/') if segments[-2].to_s.match(SLUGGED_FORMAT)

        path
      end
    end
  end

  class App
    helpers Nesta::Plugin::Sluggable::Helpers

    before do
      params[:splat] = [ Nesta::Plugin::Sluggable.resolve_path(request.path) ]
    end

    after do
      redirect(@page.permalink, 301) if (@page and !@page.best_path?(request.path))
    end
  end

  class Page

    def best_path?(path)
      path == permalink
    end

    def slug
      return nil unless File.basename(self.filename, File.extname(self.filename)).match(Plugin::Sluggable::SLUGGED_FORMAT)

      s = self.metadata('slug')
      s = self.heading.to_s.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-') if s.nil?

      s
    end

    def permalink
      p = self.abspath
      p += '/' + self.slug if self.slug

      p
    end

  end
end

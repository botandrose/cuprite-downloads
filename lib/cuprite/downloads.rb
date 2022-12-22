# frozen_string_literal: true

require "fileutils"
require "capybara"

module Capybara
  module Cuprite
    class Downloads
      class NotFound < Capybara::ExpectationNotMet; end

      def self.pathname
        @pathname ||= begin
          unique_id = Time.now.strftime('%s%L') # to keep concurrent runs from colliding
          Capybara.save_path.join(unique_id, "downloads")
       end
      end

      def pathname
        self.class.pathname
      end

      def dir
        pathname.to_s
      end

      def reset
        FileUtils.rm_rf(dir)
        FileUtils.mkdir_p(dir)
      end

      def filenames
        pathname.entries.reject(&:directory?).map(&:to_s)
      end

      def [] filename
        Capybara.current_session.document.synchronize(errors: [NotFound]) do
          begin
            File.open(pathname.join(filename))
          rescue Errno::ENOENT
            raise NotFound.new("Couldn't find #{filename} in #{filenames}")
          end
        end
      end
    end
  end
end


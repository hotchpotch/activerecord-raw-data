
module ActiveRecord
  module RawData
    class CompatibilityAdapter
      def initialize(version)
        @version = version
      end

      def ar4?
        @version == 4
      end

      def blank_scope(klass)
        ar4? ? klass.all : klass.scoped
      end

      def result_to_hash(result)
        return result unless ar4?

        result.to_hash
      end
    end
  end
end

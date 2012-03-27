
require 'activerecord-raw-data/version'

module ActiveRecord
  module RawData
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      def raw_data
        connection.select_all scoped.to_sql
      end

      def raw_rows
        connection.select_rows scoped.to_sql
      end

      def raw_values
        connection.select_values scoped.to_sql
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::RawData)


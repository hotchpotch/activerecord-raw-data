
require 'active_record'
require 'activerecord-raw-data/version'
require 'activerecord-raw-data/compatibility_adapter'

module ActiveRecord
  module RawData
    mattr_accessor :adapter

    def self.included(klass)
      klass.extend(ClassMethods)
    end

    self.adapter = ActiveRecord::RawData::CompatibilityAdapter.new(ActiveRecord::VERSION::MAJOR)

    module ClassMethods
      def raw_data
        RawData.adapter.result_to_hash(connection.select_all RawData.adapter.blank_scope(self).to_sql)
      end

      def raw_rows
        connection.select_rows RawData.adapter.blank_scope(self).to_sql
      end

      def raw_values
        connection.select_values RawData.adapter.blank_scope(self).to_sql
      end

      def raw_data_by_sql(sql)
        RawData.adapter.result_to_hash(connection.select_all sanitize_sql(sql))
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::RawData)


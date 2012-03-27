require 'active_record'
require 'database_cleaner'
require 'pathname'

tmp_dir =  Pathname.new(__FILE__).parent.parent.join('tmp')
tmp_dir.mkpath
::ActiveRecord::Base.configurations = {'test' => {:adapter => 'sqlite3', :database => tmp_dir.join("test.db").to_s}}
::ActiveRecord::Base.establish_connection('test')

class User < ::ActiveRecord::Base
  class Migration < ::ActiveRecord::Migration
    def self.up
      unless User.table_exists?
        create_table(:users) {|t|
          t.string :name
          t.string :mail
        }
      end
    end
  end
end

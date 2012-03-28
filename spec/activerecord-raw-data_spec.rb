require 'spec_helper'
require 'activerecord-raw-data'

describe ActiveRecord::RawData do
  let(:alice) { User.create(:name => 'alice', :mail => 'alice@example.com') }
  let(:bob) { User.create(:name => 'bob', :mail => 'bob@example.com') }
  let(:carol) { User.create(:name => 'carol', :mail => 'carol@example.com') }

  before(:each) do
    alice
    bob
    carol
  end

  it "should result raw data" do
    User.raw_data.should eq [
      {"id"=>1, "name"=>"alice", "mail"=>"alice@example.com"},
      {"id"=>2, "name"=>"bob", "mail"=>"bob@example.com"},
      {"id"=>3, "name"=>"carol", "mail"=>"carol@example.com"}
    ]
  end

  it "should result raw data with select" do
    User.select([:name, :mail]).raw_data.should eq [
      {"name"=>"alice", "mail"=>"alice@example.com"},
      {"name"=>"bob", "mail"=>"bob@example.com"},
      {"name"=>"carol", "mail"=>"carol@example.com"}
    ]
  end

  it "should result raw rows" do
    User.raw_rows.should eq [
      [1, "alice", "alice@example.com"],
      [2, "bob", "bob@example.com"],
      [3, "carol", "carol@example.com"]
    ]
  end

  it "should result raw rows with select" do
    User.select([:name, :mail]).raw_rows.should eq [
      ["alice", "alice@example.com"],
      ["bob", "bob@example.com"],
      ["carol", "carol@example.com"]
    ]
  end


  it "should result raw values" do
    User.raw_values.should eq [1, 2, 3]
  end

  it "should result raw values with select" do
    User.select(:name).raw_values.should eq ['alice', 'bob', 'carol']
  end

  it "should result raw values with complex sql" do
    User.raw_data_by_sql('SELECT SUBSTR(name, 1, 1) AS initial FROM users ORDER BY users.name DESC').should eq [
      {"initial" => "c"},
      {"initial" => "b"},
      {"initial" => "a"}
    ]
  end
end

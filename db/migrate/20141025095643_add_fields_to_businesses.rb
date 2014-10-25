class AddFieldsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :destination_url, :string
    add_column :businesses, :reward_1, :string
    add_column :businesses, :reward_2, :string
    add_column :businesses, :reward_3, :string
    add_column :businesses, :threshold_1, :integer
    add_column :businesses, :threshold_2, :integer
    add_column :businesses, :threshold_3, :integer
  end
end

class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.integer :business_id, index: true, null: false
      t.string :email, null: false
      t.integer :click_count, default: 0
      t.integer :conversion_count, default: 0

      t.timestamps
    end

    add_index :referrers, [:business_id, :email ], unique: true
  end
end

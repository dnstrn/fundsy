class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :title
      t.text :body
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end

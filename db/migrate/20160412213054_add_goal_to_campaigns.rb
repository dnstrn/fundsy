class AddGoalToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :goal, :integer
  end
end

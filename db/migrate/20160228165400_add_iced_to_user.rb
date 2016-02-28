class AddIcedToUser < ActiveRecord::Migration
  def change
    add_column :users, :iced, :boolean
  end
end

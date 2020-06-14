class AddLikesToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :likes, :integer
  end
end

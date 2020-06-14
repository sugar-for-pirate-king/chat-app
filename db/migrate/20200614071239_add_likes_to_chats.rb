# frozen_string_literal: true

class AddLikesToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :likes, :integer, default: 0
  end
end

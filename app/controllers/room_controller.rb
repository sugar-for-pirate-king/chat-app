# frozen_string_literal: true

class RoomController < ApplicationController
  def index
    @chat = Chat.new
    @chats = Chat.all.order(created_at: :desc)
  end
end

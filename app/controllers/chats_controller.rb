# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  include CableReady::Broadcaster

  def create
    @chat = Chat.create(chat_params)
    cable_ready['room_channel'].inner_html(
      selector: '#chats',
      html: render_to_string(partial: 'room/chats', locals: { chats: chats })
    )
    cable_ready.broadcast
    respond_to do |format|
      format.json { render json: { chat: @chat }, status: :created }
      format.js
    end
  end

  private

  def chats
    Chat.all.order(created_at: :desc)
  end

  def chat_params
    params.require(:chat).permit(:username, :text)
  end
end

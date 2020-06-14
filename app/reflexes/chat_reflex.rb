# frozen_string_literal: true

class ChatReflex < ApplicationReflex
  include CableReady::Broadcaster
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com

  def like
    chat_id = element.dataset[:id]
    chat = Chat.find_by(id: chat_id)
    chat.increment!(:likes)
    cable_ready['room_channel'].set_value(
      selector: "#like-#{chat.id}",
      value: chat.likes
    )
    cable_ready.broadcast
  end
end

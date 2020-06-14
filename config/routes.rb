# frozen_string_literal: true

Rails.application.routes.draw do
  root 'room#index'
  resources :chats
end

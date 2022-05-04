# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def publish(event)
    ActiveEventStore.publish(event)
  end
end

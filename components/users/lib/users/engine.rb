# frozen_string_literal: true

module Users
  class Engine < ::Rails::Engine
    isolate_namespace Users

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end

    ActiveSupport.on_load :active_event_store do |store|
      store.subscribe DeleteUserHandler, to: DeleteUserCommand, sync: true
      store.subscribe CreateUserHandler, to: CreateUserCommand, sync: true
      store.subscribe UserUpdater, to: UpdateUserCommand, sync: true
    end
  end
end

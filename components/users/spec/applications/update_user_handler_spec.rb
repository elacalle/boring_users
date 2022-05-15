# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateUserHandler, type: :class do
  let(:user) do
    {
      uid: '12345678',
      first_name: 'John',
      last_name: 'Doe',
      email: 'email@example.org',
      phone_number: '666777666'
    }
  end

  let(:repository) { UserInMemoryRepository.new }
  let(:records) { [OpenStruct.new(user)] }
  let(:user_updater) { UserUpdater.new(repository) }
  let(:update_user_handler) { described_class.new(user_updater) }
  let(:event) { double }

  before do
    repository.records = records
  end

  describe '#call' do
    context 'when receives an correct payload' do
      it 'updates the user' do
        payload = { uid: user[:uid], first_name: 'John', last_name: 'Snow',
                    email: 'email@example.org', phone_number: '777888777' }

        allow(event).to receive(:data).and_return(payload)
        update_user_handler.call(event)

        expect(repository.records.first.to_h).to eq payload
      end
    end
  end
end

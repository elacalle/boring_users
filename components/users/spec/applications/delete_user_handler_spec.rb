# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteUserHandler, type: :class do
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
  let(:user_delete) { UserDelete.new(repository) }
  let(:user_delete_handler) { described_class.new(user_delete) }
  let(:event) { double }

  before do
    repository.records = records
  end

  describe '#call' do
    context 'when receives an existent user uid' do
      it 'returns the user' do
        allow(event).to receive(:data).and_return({ uid: user[:uid] })

        user_delete_handler.call(event)

        expect(repository.records.count).to eq 0
      end
    end
  end
end

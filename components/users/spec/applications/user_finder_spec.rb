# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserFinder, type: :class do
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
  let(:user_finder) { described_class.new(repository) }
  let(:event) { double }

  before do
    repository.records = records
  end

  describe '#call' do
    context 'when receives an existent user uid' do
      it 'returns the user' do
        found_user = user_finder.call(user[:uid])

        expect(found_user).to eq user
      end
    end

    context 'when receives a missing user uid' do
      it 'throws user not found' do
        expect { user_finder.call(0) }.to raise_error(UserNotFound)
      end
    end
  end
end

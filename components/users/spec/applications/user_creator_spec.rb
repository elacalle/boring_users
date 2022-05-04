# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserCreator, type: :class do
  let(:payload) do
    {
      uid: '12345678',
      first_name: 'John',
      last_name: 'Doe',
      email: 'email@example.org',
      phone_number: '666777666'
    }
  end

  let(:repository) { UserInMemoryRepository.new }
  let(:user_creator) { described_class.new(repository) }
  let(:event) { double }

  describe '#call' do
    context 'when receives a correct payload' do
      it 'saves the user' do
        allow(event).to receive(:data).and_return(payload)

        user_creator.call(event)

        expect(repository.records.first.to_h).to include(payload)
      end
    end

    context 'when receives an invalid fist_name' do
      it 'raises an exception' do
        allow(event).to receive(:data).and_return(payload.merge({ first_name: nil }))

        expect { user_creator.call(event) }.to raise_error(ArgumentError)
      end
    end

    context 'when receives an invalid last_name' do
      it 'raises an exception' do
        allow(event).to receive(:data).and_return(payload.merge({ last_name: nil }))

        expect { user_creator.call(event) }.to raise_error(ArgumentError)
      end
    end

    context 'when receives an invalid email' do
      it 'raises an exception' do
        allow(event).to receive(:data).and_return(payload.merge({ email: nil }))

        expect { user_creator.call(event) }.to raise_error(ArgumentError)
      end
    end

    context 'when receives an invalid phone_number' do
      it 'raises an exception' do
        allow(event).to receive(:data).and_return(payload.merge({ phone_number: nil }))

        expect { user_creator.call(event) }.to raise_error(ArgumentError)
      end
    end
  end
end

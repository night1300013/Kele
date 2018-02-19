require 'spec_helper'
require 'httparty'

describe Kele, type: :request do
  #include HTTParty
  context 'kele' do
    describe 'version' do
      it 'has a version number' do
          expect(Kele::VERSION).not_to be nil
      end
    end

    describe '#initialize' do
      it "authenticates user and return right token" do
        VCR.use_cassette('initialize') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])

          expect(kele.instance_variable_get(:@auth_token)).to be_a String
          expect(kele.instance_variable_get(:@auth_token)).to eq ENV['AUTH_TOKEN']
        end
      end
    end

    describe '#get_me' do
      it "returns an object and right id" do
        VCR.use_cassette('get_me') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_me = kele.get_me

          expect(get_me).to be_a Object
          expect(get_me['id']).to eq ENV['ID'].to_i
        end
      end
    end

    describe '#get_mentor_availability' do
      it "returns an object" do
        VCR.use_cassette('get_mentor_availability') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_mentor_availability = kele.get_mentor_availability(ENV['MENTOR_ID'])

          expect(get_mentor_availability).to be_a Object
        end
      end
    end

    describe '#get_roadmap' do
      it "returns an object" do
        VCR.use_cassette('get_roadmap') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_roadmap = kele.get_roadmap(ENV['ROADMAP_ID'])

          expect(get_roadmap).to be_a Object
        end
      end
    end

    describe '#get_checkpoint' do
      it "returns an object" do
        VCR.use_cassette('get_checkpoint') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_checkpoint = kele.get_checkpoint(ENV['CHECKPOINT_ID'])

          expect(get_checkpoint).to be_a Object
        end
      end
    end

    describe '#get_messages' do
      it "returns an object" do
        VCR.use_cassette('get_messages') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_messages = kele.get_messages(ENV['MESSAGE_ID'])
          get_messages_default = kele.get_messages()

          expect(get_messages).to be_a Object
          expect(get_messages_default).to be_a Object
        end
      end
    end

    describe '#create_message' do
      it "returns an object" do
        VCR.use_cassette('create_message') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          create_message = kele.create_message(ENV['SENDER'],ENV['RECIPIENT_ID'],ENV['SUBJECT'],ENV['TEXT'])

          expect(create_message).to be_a Object
        end
      end
    end

    describe '#create_submission' do
      it "returns an object" do
        VCR.use_cassette('create_submission') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_me = kele.get_me
          create_submission = kele.create_submission(ENV['BRANCH'], ENV['URL'], ENV['SUBMISSION_CHECKPOINT_ID'], ENV['COMMENT'])

          expect(create_submission).to be_a Object
        end
      end
    end

    describe '#update_submission' do
      it "returns an object" do
        VCR.use_cassette('update_submission') do
          kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
          get_me = kele.get_me
          update_submission = kele.update_submission(ENV['CHECKPOINT_SUB_ID'], ENV['SUBMISSION_CHECKPOINT_ID'], ENV['BRANCH'], ENV['URL'], ENV['COMMENT'])

          expect(update_submission).to be_a Object
        end
      end
    end
  end
end

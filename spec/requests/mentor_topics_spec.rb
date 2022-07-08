require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/mentor_topics', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # MentorTopic. As you add validations to MentorTopic, be sure to
  # adjust the attributes here as well.

  before do
    @user = User.first
    @mentor = Mentor.first
    @topic = Topic.first
  end

  let(:valid_attributes) do
    {
      mentor_id: @mentor.id,
      topic_id: @topic.id,
      rating: 3
    }
  end

  let(:invalid_attributes) do
    {
      mentor_id: @mentor.id,
      topic_id: @topic.id,
      rating: 10
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MentorTopicsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {
      Authorization: "Bearer #{@user.generate_jwt}"
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      MentorTopic.create! valid_attributes
      get mentor_mentor_topics_url(@mentor), headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new MentorTopic' do
        expect do
          post mentor_mentor_topics_url(@mentor),
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(MentorTopic, :count).by(1)
      end

      it 'renders a JSON response with the new mentor_topic' do
        post mentor_mentor_topics_url(@mentor),
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new MentorTopic' do
        expect do
          post mentor_mentor_topics_url(@mentor),
               params: { mentor_topic: invalid_attributes }, as: :json
        end.to change(MentorTopic, :count).by(0)
      end

      it 'renders a JSON response with errors for the new mentor_topic' do
        post mentor_mentor_topics_url(@mentor),
             params: { mentor_topic: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested mentor_topic' do
      mentor_topic = MentorTopic.create! valid_attributes
      expect do
        delete mentor_mentor_topic_url(@mentor, mentor_topic), headers: valid_headers, as: :json
      end.to change(MentorTopic, :count).by(-1)
    end
  end
end

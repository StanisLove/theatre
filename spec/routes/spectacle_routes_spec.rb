RSpec.describe SpectacleRoutes, type: :routes do
  describe 'GET /spectacles' do
    before do
      create_list(:spectacle, 3)
    end

    it 'returns a collection of spectacles' do
      get '/spectacles'

      expect(last_response.status).to eq(200)
      expect(response_body['data'].size).to eq(3)
    end
  end

  describe 'POST /spectacles' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/spectacles'

        expect(last_response.status).to eq(422)
      end
    end

    context 'invalid parameters' do
      let(:params) do
        {
          title: '',
          description: 'Description',
        }
      end

      it 'returns an error' do
        post '/spectacles', spectacle: params

        expect(last_response.status).to eq(422)
      end
    end

    context 'valid parameters' do
      let(:params) do
        {
          title: 'Spectacle title',
          description: 'Spectacle description',
        }
      end

      it 'creates a spectacle', :aggregate_failures do
        expect { post '/spectacles', spectacle: params }
          .to change(Spectacle, :count).from(0).to(1)

        expect(last_response.status).to eq(201)
      end

      it 'returns a spectacle' do
        post '/spectacles', spectacle: params

        expect(response_body['data']).to a_hash_including(
          'id'   => Spectacle.last.id.to_s,
          'type' => 'spectacle'
        )
      end
    end
  end
end

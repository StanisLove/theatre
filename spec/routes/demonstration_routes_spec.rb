# frozen_string_literal: true

RSpec.describe DemonstrationRoutes, type: :routes do
  describe 'GET /demonstrations' do
    before do
      create_list(:demonstration, 3)
    end

    it 'returns a collection of demonstrations' do
      get '/demonstrations'

      expect(last_response.status).to eq(200)
      expect(response_body['data'].size).to eq(3)
    end
  end

  describe 'POST /demonstrations' do
    shared_context 'unprocessable' do
      it 'returns an error' do
        post '/demonstrations', demonstration: params
        expect(last_response.status).to eq(422)
      end
    end

    let(:spectacle) { create :spectacle }
    let(:start_date) { '2020-10-01' }
    let(:finish_date) { '2020-10-10' }

    context 'invalid parameters' do
      context 'without spectacle_id' do
        let(:params) { Hash[start_date: start_date, finish_date: finish_date] }

        it_behaves_like 'unprocessable'
      end

      context 'without date' do
        let(:params) { Hash[start_date: start_date, spectacle_id: spectacle.id] }

        it_behaves_like 'unprocessable'
      end

      context 'with wrong dates' do
        let(:params) do
          Hash[finish_date: start_date, start_date: finish_date, spectacle_id: spectacle.id]
        end

        it_behaves_like 'unprocessable'
      end

      context 'with occupied dates' do
        let(:params) do
          Hash[finish_date: finish_date, start_date: start_date, spectacle_id: spectacle.id]
        end

        before { create :demonstration, start_date: finish_date, finish_date: '2020-11-10' }

        it_behaves_like 'unprocessable'
      end
    end

    context 'valid parameters' do
      let(:params) do
        Hash[finish_date: finish_date, start_date: start_date, spectacle_id: spectacle.id]
      end

      it 'creates a demonstration', :aggregate_failures do
        expect { post '/demonstrations', demonstration: params }
          .to change(Demonstration, :count).from(0).to(1)
        expect(last_response.status).to eq(201)
      end

      it 'returns a demonstration' do
        post '/demonstrations', demonstration: params

        expect(response_body['data']).to a_hash_including(
          'id' => Demonstration.last.id.to_s,
          'type' => 'demonstration'
        )
      end
    end
  end
end

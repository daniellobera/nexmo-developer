require 'rails_helper'

RSpec.describe 'Markdown', type: :request do
  describe '#show' do
    it 'redirects if locale is missing' do
      get '/concepts/overview'

      expect(response).to redirect_to('/en/concepts/overview')
    end

    context 'with a namespace' do
      it 'responds 200 for product-lifecycle' do
        get '/product-lifecycle/beta'

        expect(response).to have_http_status(:ok)
      end

      it 'responds 200 for contribute' do
        get '/contribute/overview'

        expect(response).to have_http_status(:ok)
      end

      it '/contribute redirects' do
        get '/contribute'

        expect(response).to redirect_to('/contribute/overview')
      end
    end

    context 'when the file specifies a redirect' do
      it 'redirects' do
        get '/en/client-sdk/sdk-documentation/ios/ios'

        expect(response).to redirect_to('/sdk/stitch/ios/')
      end
    end
  end
end

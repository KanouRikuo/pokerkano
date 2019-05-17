require 'rails_helper'

RSpec.describe "Check", type: :request do
  describe "POST /api/ver1/cards/check" do
    context '有効なパラメータの場合' do
      before do
        cards = {"cards": ["C7 C6 C5 C4 C3", "D1 D10 S9 C5 C4"]}
        post '/api/ver1/cards/check', params: cards
      end

      it 'リクエストは201 Createdとなること' do
        expect(response.status).to eq 201
      end

      it '期待する役および最も強い手札が判定されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body[0]["cards"]["card_set"]).to eq 'C7 C6 C5 C4 C3'
        expect(json_body[0]["cards"]["result"]).to eq 'ストレートフラッシュ'
        expect(json_body[0]["cards"]["best"]).to eq true
        expect(json_body[1]["cards"]["card_set"]).to eq 'D1 D10 S9 C5 C4'
        expect(json_body[1]["cards"]["result"]).to eq 'ハイカード'
        expect(json_body[1]["cards"]["best"]).to eq false
      end

    end

    context '無効なパラメータの場合' do
      before do
        invalid_cards = {"cards": ["C7 C6 C5 C4 C3 C2", ""]}
        post '/api/ver1/cards/check', params: invalid_cards
      end

      it 'リクエストは201 Createdとなること' do
        expect(response.status).to eq 201
      end

      it '期待するエラーメッセージが格納されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body[0]["error"]["card_set"]).to eq 'C7 C6 C5 C4 C3 C2'
        expect(json_body[0]["error"]["error"]).to eq "5つのカード指定文字を半角スペース区切りで入力してください.（例：S1 H3 D9 C13 S11）"
        expect(json_body[1]["error"]["card_set"]).to eq ''
        expect(json_body[1]["error"]["error"]).to eq "5つのカード指定文字を半角スペース区切りで入力してください.（例：S1 H3 D9 C13 S11）"
      end

    end

    context '不正なURLの場合' do
      before do
        cards = {"cards": ["C7 C6 C5 C4 C3", "D1 D10 S9 C5 C4"]}
        post '/api/ver1/check', params: cards
      end

      it 'リクエストは404 Not Foundとなること' do
        expect(response.status).to eq 404
      end

      it '期待するエラーメッセージが格納されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["error"]).to eq '404 Not Found：指定されたURLは存在しません'
      end

    end

  end
end
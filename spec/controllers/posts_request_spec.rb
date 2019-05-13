require 'rails_helper'

describe PostsController, type: :request do

  describe 'GET #index' do

    it 'リクエストが成功すること' do
      get '/'
      expect(response.status).to eq 200
    end

    it 'テンプレートが表示されていること' do
      get '/'
      expect(response.body).to include "Check"
      expect(response.body).to include "©Copyright 2019 porkerhands All Rights Reserved."
    end

  end

  describe 'POST #complete' do

    context 'パラメータが妥当な場合' do

      it 'リクエストが成功すること' do
        post '/', {params: {card: 'A1 A2 A3 A4 A5'}}
        expect(response.status).to eq 200
      end


      it 'テンプレートを表示すること(renderされているから)' do
        post '/', {params: {card: 'A1 A2 A3 A4 A5'}}
        expect(response.body).to include 'Copyright'
      end

    end

    describe 'パラメータが不正な場合' do

      context 'valid1失敗' do

        it 'リクエストが成功すること' do
          post '/', {params: {card: 'A1 A2 A3 A4'}}
          expect(response.status).to eq 200
        end

        it 'エラーが表示されること' do
          post '/', {params: {card: 'A1 A2 A3 A4'}}
          expect(response.body).to include "5つのカード指定文字を半角スペース区切りで入力してください"
        end

      end

      context 'valid2失敗' do

        it 'リクエストが成功すること' do
          post '/', {params: {card: 'H1 H2 H3 A4 A5'}}
          expect(response.status).to eq 200
        end

        it 'エラーが表示されること' do
          post '/', {params: {card: 'H1 H2 H3 A4 A5'}}
          expect(response.body).to include '番目のカード指定文字が不正です'
        end

      end

      context 'valid3失敗' do

        it 'リクエストが成功すること' do
          post '/', {params: {card: 'H2 H2 H3 H4 H5'}}
          expect(response.status).to eq 200
        end

        it 'エラーが表示されること' do
          post '/', {params: {card: 'H2 H2 H3 H4 H5'}}
          expect(response.body).to include 'カードが重複しています'
        end

      end
    end
  end

end

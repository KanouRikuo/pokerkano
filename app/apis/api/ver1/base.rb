# バージョン１の中で、基底となるAPIクラスを作成します。
# ここで 各APIの実体をマウントします。

module API
  module Ver1
    class Base < Grape::API
      # APIアクセスにバージョン情報を付加する
      #  http://localhost:3000/api/ver1/と定義する
      version 'ver1', :using => :path
      # 未指定の場合にJSONで返すように変更（URLで指定可能）
      format :json
      # rescue_fromは書いた順番にマッチングされる

      # 400 Bad Request
      rescue_from Grape::Exceptions::Base do
        # rescue_from Grape::Exceptions::ValidationErrors do
        # メソッドがオブジェクトを変更してデータベースに保存する場合、メソッド名の末尾に必ず!を付ける
        # do はブロックを表す
        # error!({key: value},HTTPステータスコード)
        error!({error: "400 Bad Request：不正なリクエストです"}, 400)
      end

      # 404 Not Found

      # rescue_from ActiveRecord::RecordNotFound do
      route :any, '*path' do
        error!({error: "404 Not Found：指定されたURLは存在しません"}, 404)
      end

      # 500 Internal Server Error
      rescue_from Exception do
        error!({error: "500 Internal Server Error：予期しないエラーです"}, 500)
      end


      #app/apis/api/ver1/cards/check.rbをマウント
      mount API::Ver1::Results

    end
  end
end


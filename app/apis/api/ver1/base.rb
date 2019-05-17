module API
  module Ver1
    class Base < Grape::API
      # APIアクセスにバージョン情報を付加
      # ex) http://localhost:3000/api/verl/
      version 'ver1', :using => :path
      # 未指定の場合にJSONで返すように変更（URLで指定可能）
      format :json
      # rescue_fromは書いた順番にマッチングされる

      # 400 Bad Request
      rescue_from Grape::Exceptions::Base do
        error!({error: "400 Bad Request：不正なリクエストです"}, 400)
      end

      # 404 Not Found
      route :any, '*path' do
        error!({error: "404 Not Found：指定されたURLは存在しません"}, 404)
      end

      # 500 Internal Server Error
      rescue_from Exception do
        error!({error: "500 Internal Server Error：予期しないエラーです"}, 500)
      end
      mount API::Ver1::Users

    end
  end
end
#
#   # 例外ハンドル 404
#   rescue_from ActiveRecord::RecordNotFound do |e|
#     rack_response({ message: e.message, status: 404 }.to_json, 404)
#   end
#
#   # 例外ハンドル 400
#   rescue_from Grape::Exceptions::ValidationErrors do |e|
#     rack_response e.to_json, 400
#   end
#
#   # 例外ハンドル 500
#   rescue_from :all do |e|
#     if Rails.env.development?
#       raise e
#     else
#       error_response(message: "Internal server error", status: 500)
#     end
#   end
#
#   mount API::Ver1::Users
# end
#
#   end
# end
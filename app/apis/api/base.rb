# 基底となるAPIクラスを作成します。

# このファイルで各バージョンのAPIをマウントします

module API
  class Base < Grape::API

    format :json
    # urlの第１セグメント名 ex) http://localhost/api/
    prefix 'api'
    #app/apis/api/ver1.rbをマウント
    mount API::Ver1::Base
  end
end
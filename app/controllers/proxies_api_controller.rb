class ProxiesApiController < ApplicationController

  before_filter :basic_auth

  def index
    #proxy = Proxy.where(tested: true, bad:false).random
    proxy = Proxy.where(bad: false).random

    @ip = proxy.ip
    @port = proxy.port.to_i
    json = {"ip" => @ip, "port" => @port, "proxy_id" => proxy.id}.to_json
    render json: json
  end
end

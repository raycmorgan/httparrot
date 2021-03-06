defmodule HTTParrot.GetHandlerTest do
  use ExUnit.Case
  import :meck
  import HTTParrot.GetHandler

  setup do
    new HTTParrot.GeneralRequestInfo
    new JSEX
  end

  teardown do
    unload HTTParrot.GeneralRequestInfo
    unload JSEX
  end

  test "returns prettified json with query values, headers, url and origin" do
    expect(HTTParrot.GeneralRequestInfo, :retrieve, 1, {:info, :req2})
    expect(JSEX, :encode!, [{[:info], :json}])

    assert get_json(:req1, :state) == {:json, :req2, :state}

    assert validate HTTParrot.GeneralRequestInfo
    assert validate JSEX
  end
end

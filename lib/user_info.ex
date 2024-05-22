defmodule Auth0Jwks.UserInfo do
  alias Auth0Jwks.Config

  def from_token(token) do
    req = Req.new(base_url: Config.iss(), headers: %{authorization: "Bearer #{token}"})

    Req.get!(req,
      url: "userinfo",
      connect_options: [
        timeout: Config.timeout()
      ],
      receive_timeout: Config.timeout()
    ).body
  end
end

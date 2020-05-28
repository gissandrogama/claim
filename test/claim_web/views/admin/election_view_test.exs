defmodule ClaimWeb.Admin.ElectionViewTest do
  use ExUnit.Case, async: true

  import Claim.Factory

  alias ClaimWeb.Admin.ElectionView


  test "render/2 returns ok and the election data" do
    election = build(:election, id: 1)

    assert %{
              status: "ok",
              data: %{
                id: 1,
                name: "Election 2020/06",
                cover: "http-to-an-image",
                notice: "http-to-an-pdf",
                starts_at: ~U[2020-05-30 08:00:00Z],
                ends_at: ~U[2020-06-30 20:59:59Z]
              }
    } = ElectionView.render("election.json", %{election: election})
  end
end

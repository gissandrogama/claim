defmodule Claim.ListElectionsTest do
  use Claim.DataCase, async: true

  import Claim.Factory

  alias Claim.ListElections

  describe "run/0" do
    test "returns the elections ordered by name" do
      insert(:election, name: "Election B")
      insert(:election, name: "Election A")

      elections = ListElections.run()
      assert is_list(elections)
      assert length(elections) == 2
      assert Enum.map(elections, & &1.name) == ["Election A", "Election B"]
    end
  end
end

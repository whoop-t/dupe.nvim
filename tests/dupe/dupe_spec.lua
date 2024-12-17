local plugin = require("dupe")

describe("setup", function()
  it("works with default", function()
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
  end)
end)

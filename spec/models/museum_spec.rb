require 'rails_helper'

describe Museum do
  let!(:museum) do
   create(:museum, name: "Pocahontas")
  end
end

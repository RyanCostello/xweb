require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  test "new character requires name field" do
    p = Player.new
    #p.character_name = "Faith"
    p.character_class = "Rogue"
    p.character_level = "11"
    assert(!p.valid?)
  end
  
  test "existing character defines name field" do
    p = players(:player_1)
    assert_not_nil(p)
    assert_not_nil(p.character_name)
  end
  
end